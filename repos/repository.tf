resource "github_repository" "tf_lab_app" {
  name                   = "tf-lab-app"
  description            = "TF GitHub lab repository for nodejs app"
  visibility             = "public"
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  allow_squash_merge     = true
  allow_merge_commit     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  auto_init              = true
}

resource "github_repository_vulnerability_alerts" "app_vulnerability_alerts" {
  repository = github_repository.tf_lab_app.name
  enabled    = true
}

resource "github_team_repository" "nodejs_push" {
  team_id    = "nodejs-team"
  repository = github_repository.tf_lab_app.name
  permission = "push"
}

resource "github_team_repository" "security_push" {
  team_id    = data.terraform_remote_state.base.outputs.security_manager_team_slug
  repository = github_repository.tf_lab_app.name
  permission = "push"
}

resource "github_team_repository" "devops_pull" {
  team_id    = "devops-team"
  repository = github_repository.tf_lab_app.name
  permission = "pull"
}

resource "github_repository_file" "codeowners" {
  repository          = github_repository.tf_lab_app.name
  branch              = "main"
  file                = ".github/CODEOWNERS"
  content             = "* @${data.github_organization.current_org.orgname}/${data.terraform_remote_state.base.outputs.security_manager_team_slug}\n"
  commit_message      = "chore: automated provisioning of CODEOWNERS rule"
  commit_author       = "Terraform Automation"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}