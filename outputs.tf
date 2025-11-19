output "teams" {
  description = "Information about created teams"
  value = {
    for team_name, team in github_team.project : team_name => {
      id   = team.id
      name = team.name
      slug = team.slug
    }
  }
}

output "repositories" {
  description = "Information about created repositories"
  value = {
    for repo_name, repo in github_repository.repo : repo_name => {
      name          = repo.name
      full_name     = repo.full_name
      html_url      = repo.html_url
      clone_url     = repo.http_clone_url
      ssh_clone_url = repo.ssh_clone_url
    }
  }
}

output "team_memberships" {
  description = "Team membership summary"
  value = {
    for project_name, project in var.projects : project_name => {
      project_lead = project.project_lead
      members      = [for member in project.members : member.username]
      repositories = [for repo in project.repositories : repo.name]
    }
  }
}

output "project_summary" {
  description = "Summary of all projects and their configuration"
  value = {
    total_projects     = length(var.projects)
    total_repositories = length(local.all_repos)
    total_memberships  = length(local.all_memberships)
    projects = {
      for project_name, project in var.projects : project_name => {
        project_display_name = try(project.project_display_name, project_name)
        project_lead         = project.project_lead
        repositories         = length(project.repositories)
        members              = length(project.members)
        main_repo            = local.project_main_repos[project_name]
      }
    }
  }
}

output "documentation_pages" {
  description = "Documentation pages created for each project"
  value = {
    for project_name, _ in var.projects : project_name => {
      repository = "https://github.com/${github_repository.repo[local.project_main_repos[project_name]].full_name}"
      project    = "https://github.com/${github_repository.repo[local.project_main_repos[project_name]].full_name}/projects"

      team_and_roles = "https://github.com/${github_repository.repo[local.project_main_repos[project_name]].full_name}/blob/main/docs/Team.md"
    }
  }
}
