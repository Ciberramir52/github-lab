resource "github_actions_organization_secret" "api_username" {
  secret_name = "API_USERNAME"
  visibility  = "selected"
  value       = var.username
}

resource "github_actions_organization_secret" "api_password" {
  secret_name = "API_PASSWORD"
  visibility  = "selected"
  value       = var.password
}