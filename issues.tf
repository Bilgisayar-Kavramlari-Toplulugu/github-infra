
# ============================================
# Github Issues 
# ============================================


# Create labels for issues
resource "github_issue_label" "setup" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "setup"
  color       = "1d76db"
  description = "Initial setup tasks"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository,
      name,
      color,
      description
    ]
  }
}

resource "github_issue_label" "priority_high" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "priority:high"
  color       = "d93f0b"
  description = "High priority tasks"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository,
      name,
      color,
      description
    ]
  }
}

# Create initial setup issue for each project
resource "github_issue" "initial_setup" {
  for_each = { for project_name, project in var.projects : project_name => project }

  repository = github_repository.repo[local.project_main_repos[each.key]].name
  title      = "Initial Setup"
  body = replace(
    replace(
      file("${path.module}/docs/Initial-Setup-Issue.md"),
      "{{PROJECT_NAME}}", each.key
    ),
    "{{PROJECT_LEAD}}", each.value.project_lead
  )

  assignees = [each.value.project_lead]
  labels    = ["setup", "priority:high"]

  depends_on = [
    github_repository.repo,
    github_issue_label.setup,
    github_issue_label.priority_high
  ]

  lifecycle {
    ignore_changes = [
      title,
      body,
      assignees,
      labels,
      repository
    ]
  }
}


# ============================================
# LABELS FOR REPORTED CONTENT SYSTEM
# ============================================

resource "github_issue_label" "report_abuse" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "report:abuse"
  color       = "d93f0b"
  description = "Davranış kuralları ihlali bildirimi"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository, 
      name, 
      color, 
      description
    ]
  }
}

resource "github_issue_label" "needs_triage" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "needs-triage"
  color       = "fbca04"
  description = "İlk inceleme gerekiyor"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository, 
      name, 
      color, 
      description
    ]
  }
}

resource "github_issue_label" "bug" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "bug"
  color       = "d73a4a"
  description = "Bir şeyler çalışmıyor"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository, 
      name, 
      color, 
      description
    ]
  }
}

resource "github_issue_label" "enhancement" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "enhancement"
  color       = "a2eeef"
  description = "Yeni özellik veya iyileştirme"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository, 
      name, 
      color, 
      description
    ]
  }
}

resource "github_issue_label" "task" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository  = github_repository.repo[each.key].name
  name        = "görev"
  color       = "0e8a16"
  description = "Proje yönetimi görevi"

  depends_on = [github_repository.repo]

  lifecycle {
    ignore_changes = [
      repository, 
      name, 
      color, 
      description
    ]
  }
}