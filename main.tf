provider "github" {
  owner = var.github_organization
  token = var.github_token
}

locals {
  # Map project names to their first repository (main repo)
  project_main_repos = {
    for project_name, project in var.projects :
    project_name => project.repositories[0].name
  }

  # Flatten repos from projects
  all_repos = flatten([
    for project_name, project in var.projects : [
      for repo in project.repositories : {
        project_name         = project_name                                    # Key (map key)
        project_display_name = try(project.project_display_name, project_name) # Display name
        repo_name            = repo.name
        description          = repo.description
        visibility           = repo.visibility
        project_lead         = project.project_lead
        team_permission      = project.team_permission
        license              = try(repo.license, "mit")
        gitignore_template = try(
          trimspace(repo.gitignore_template),
          "Dotnet"
        )
      }
    ]
  ])

  # Flatten team memberships
  all_memberships = flatten([
    for project_name, project in var.projects : [
      for member in project.members : {
        project = project_name
        user    = member.username
        role    = member.role
      }
    ]
  ])
}

# Create teams for each project
resource "github_team" "project" {
  for_each    = var.projects
  name        = each.value.team_name
  description = "${each.key} projesi geliştirme ekibi"
  privacy     = "closed"
}

# Create repositories for each project
resource "github_repository" "repo" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  name        = each.key
  description = each.value.description
  visibility  = each.value.visibility

  has_issues      = true
  has_wiki        = true
  has_projects    = true
  has_discussions = true

  delete_branch_on_merge = true
  auto_init              = true

  # Lisans ayarı:none ise lisans oluşturma, belirtilmemiş veya "" ise mit kullan, yoksa belirtilen lisansı kullan
  license_template = (
    lower(each.value.license) == "none"
    ) ? null : (
    each.value.license == null ||
    each.value.license == "" ||
    lower(each.value.license) == "mit"
  ) ? "mit" : lower(each.value.license)


  # gitignore_template -itignore_template - eğer kullanıcı belirtmişse onu kullan
  gitignore_template = each.value.gitignore_template != "" ? each.value.gitignore_template : null

  # Enable branch protection
  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = false
  allow_auto_merge   = true

  lifecycle {
    ignore_changes = [
      description,
      visibility,
      has_wiki
    ]
  }
}

# Set up team access to repositories
resource "github_team_repository" "access" {
  for_each   = { for repo in local.all_repos : repo.repo_name => repo }
  team_id    = github_team.project[each.value.project_name].id
  repository = github_repository.repo[each.key].name
  permission = each.value.team_permission
}

# Add team members
resource "github_team_membership" "members" {
  for_each = { for m in local.all_memberships : "${m.project}-${m.user}" => m }
  team_id  = github_team.project[each.value.project].id
  username = each.value.user
  role     = each.value.role
}

# Grant admin access to project leads
resource "github_repository_collaborator" "project_lead" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  username   = each.value.project_lead
  permission = "admin"
}

# Create additional relelae and develop branches for each repository
resource "github_branch" "release" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository    = github_repository.repo[each.key].name
  branch        = "release"
  source_branch = try(github_repository.repo[each.key].default_branch, "main")

  depends_on = [github_repository.repo]
}

resource "github_branch" "develop" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository    = github_repository.repo[each.key].name
  branch        = "develop"
  source_branch = try(github_repository.repo[each.key].default_branch, "main")

  depends_on = [github_repository.repo]
}

# Branch protection rules (only for public repositories)
resource "github_branch_protection" "main" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo if repo.visibility == "public" }

  repository_id = github_repository.repo[each.key].node_id
  pattern       = "main"

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
    restrict_dismissals             = false
    require_code_owner_reviews      = true
  }

  enforce_admins         = false
  allows_deletions       = false
  allows_force_pushes    = false
  require_signed_commits = false

  depends_on = [
    github_repository.repo,
    github_branch.release,
    github_branch.develop,

  ]
}



