resource "github_repository" "tf_github_lab_base_repository" {
  name        = "tf-lab-devops"
  description = "${local.org_name}, repository for DevOps team"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_vulnerability_alerts" "vulnerability_alerts" {
  repository = github_repository.tf_github_lab_base_repository.name
  enabled    = true
}