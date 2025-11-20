
# ============================================
# Files to be created in each repository
# ============================================

# Project Definition document
resource "github_repository_file" "Project-Definition" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Project-Definition.md"
  content = replace(
    replace(
      file("${path.module}/docs/Project-Definition.md"),
      "{{PROJECT_NAME}}", each.value.project_display_name
    ),
    "{{PROJECT_LEAD}}", each.value.project_lead
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_repository_collaborator.project_lead
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Architecture Overview document
resource "github_repository_file" "Architecture-Overview" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Architecture-Overview.md"
  content = replace(
    file("${path.module}/docs/Architecture-Overview.md"),
    "{{PROJECT_NAME}}", each.value.project_display_name
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo

  ]
  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Development Workflow document
resource "github_repository_file" "Development-Workflow" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Development-Workflow.md"
  content = replace(
    file("${path.module}/docs/Development-Workflow.md"),
    "{{PROJECT_NAME}}", each.value.project_display_name
  )
  commit_message = "initial commit"

  overwrite_on_create = true
  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Verified Commits Guide document
resource "github_repository_file" "Verified-Commits-Guide" {
  for_each   = { for repo in local.all_repos : repo.repo_name => repo }
  repository = github_repository.repo[each.key].name
  file       = "docs/Verified-Commits-Guide.md"
  content = replace(
    file("${path.module}/docs/Verified-Commits-Guide.md"),
    "{{PROJECT_NAME}}", each.value.project_display_name
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Dynamic content for the Team page
resource "github_repository_file" "team" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Team.md"

  content = replace(
    replace(
      replace(
        replace(
          replace(
            replace(
              replace(
                file("${path.module}/docs/Team.md"),
                "{{PROJECT_NAME}}", each.value.project_display_name
              ),
              "{{TEAM_NAME}}", var.projects[each.value.project_name].team_name
            ),
            "{{GITHUB_ORG}}", var.github_organization
          ),
          "{{PROJECT_LEAD}}", each.value.project_lead
        ),
        "{{MEMBER_COUNT}}", tostring(length(var.projects[each.value.project_name].members))
      ),
      "{{MAINTAINER_COUNT}}", tostring(length([
        for m in var.projects[each.value.project_name].members : m if m.role == "maintainer"
      ]))
    ),
    "{{REGULAR_MEMBER_COUNT}}", tostring(length([
      for m in var.projects[each.value.project_name].members : m if m.role == "member"
      ])
    )
  )

  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_repository_collaborator.project_lead,
    github_team.project
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# README file with dynamic content
resource "github_repository_file" "readme" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "README.md"
  content = replace(
    replace(
      replace(
        replace(
          file("${path.module}/docs/README.md"),
          "{{PROJECT_NAME}}", each.value.project_display_name
        ),
        "{{PROJECT_LEAD}}", each.value.project_lead
      ),
      "{{GITHUB_ORG}}", var.github_organization
    ),
    "{{REPO_NAME}}", each.key
  )
  commit_message = "initial commit"

  depends_on = [
    github_repository.repo,
    github_repository_collaborator.project_lead
  ]

  overwrite_on_create = true # This will overwrite the auto-generated README

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# CONTRIBUTING file with dynamic content
resource "github_repository_file" "contributing" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  file           = ".github/CONTRIBUTING.md"
  content        = file("${path.module}/docs/CONTRIBUTING.md")
  commit_message = "initial commit"

  depends_on = [
    github_repository.repo
  ]

  overwrite_on_create = true # This will overwrite the auto-generated README

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Code of Conduct file with dynamic content
resource "github_repository_file" "code_of_conduct" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  branch         = "main"
  file           = "CODE_OF_CONDUCT.md"
  content        = file("${path.module}/docs/CODE_OF_CONDUCT.md")
  commit_message = "initial commit"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Wiki Home page with dynamic content
resource "github_repository_file" "wiki_home" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  file       = "docs/Wiki-Home.md" # Wiki için referans
  content = replace(
    replace(
      replace(
        replace(
          replace(
            file("${path.module}/docs/Wiki-Home.md"),
            "{{PROJECT_NAME}}", each.value.project_display_name
          ),
          "{{PROJECT_LEAD}}", each.value.project_lead
        ),
        "{{TEAM_NAME}}", var.projects[each.value.project_name].team_name
      ),
      "{{GITHUB_ORG}}", var.github_organization
    ),
    "{{REPO_NAME}}", each.key
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_repository_collaborator.project_lead,
    github_team.project
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Create .gitignore file if no template is specified
resource "github_repository_file" "gitignore" {
  for_each = {
    for repo in local.all_repos : repo.repo_name => repo
    if repo.gitignore_template == "" # Sadece template belirtilmemişse oluştur
  }

  repository     = github_repository.repo[each.key].name
  branch         = "main"
  file           = ".gitignore"
  content        = file("${path.module}/.gitignore")
  commit_message = "initial commit"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}


# ============================================
# Files to be created in the .github folder
# ============================================

resource "github_repository_file" "codeowners" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  branch         = "main"
  file           = ".github/CODEOWNERS"
  content        = "* @${each.value.project_lead}\n"
  commit_message = "initial commit"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Create default pull request template
resource "github_repository_file" "pr_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository     = github_repository.repo[each.key].name
  file           = ".github/PULL_REQUEST_TEMPLATE.md"
  content        = file("${path.module}/docs/PULL_REQUEST_TEMPLATE.md")
  commit_message = "initial commit"

  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# REPORTED CONTENT & ISSUE TEMPLATES SYSTEM

# Configuration for issue templates
resource "github_repository_file" "issue_template_config" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  branch     = "main"
  file       = ".github/ISSUE_TEMPLATE/config.yml.tpl"
  content = replace(
    replace(
      file("${path.module}/docs/ISSUE_TEMPLATE/config.yml.tpl"),
      "{{GITHUB_ORG}}", var.github_organization
    ),
    "{{REPO_NAME}}", each.key
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }

}

# Abuse report template
resource "github_repository_file" "report_abuse_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository = github_repository.repo[each.key].name
  branch     = "main"
  file       = ".github/ISSUE_TEMPLATE/report-abuse.yml"
  content = replace(
    replace(
      replace(
        file("${path.module}/docs/ISSUE_TEMPLATE/report-abuse.yml"),
        "{{PROJECT_LEAD}}", each.value.project_lead
      ),
      "{{GITHUB_ORG}}", var.github_organization
    ),
    "{{REPO_NAME}}", each.key
  )
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo,
    github_repository_collaborator.project_lead
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Task template
resource "github_repository_file" "task_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository          = github_repository.repo[each.key].name
  branch              = "main"
  file                = ".github/ISSUE_TEMPLATE/task.yml"
  content             = file("${path.module}/docs/ISSUE_TEMPLATE/task.yml")
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Bug report template
resource "github_repository_file" "bug_report_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository          = github_repository.repo[each.key].name
  branch              = "main"
  file                = ".github/ISSUE_TEMPLATE/bug-report.yml"
  content             = file("${path.module}/docs/ISSUE_TEMPLATE/bug-report.yml")
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}

# Feature request template
resource "github_repository_file" "feature_request_template" {
  for_each = { for repo in local.all_repos : repo.repo_name => repo }

  repository          = github_repository.repo[each.key].name
  branch              = "main"
  file                = ".github/ISSUE_TEMPLATE/feature-request.yml"
  content             = file("${path.module}/docs/ISSUE_TEMPLATE/feature-request.yml")
  commit_message      = "initial commit"
  overwrite_on_create = true

  depends_on = [
    github_repository.repo
  ]

  # lifecycle {
  #   ignore_changes = [
  #     content,
  #     commit_message
  #   ]
  # }
}