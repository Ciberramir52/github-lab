output "organization_id" {
  description = "The unique unique ID/Node ID tracking the target GitHub Organization"
  value       = data.github_organization.current.id
}

output "teams_ids" {
  description = "A set of unique identifiers for all provisioned infrastructure teams"
  value = toset([
    github_team.devops_team.id,
    github_team.nodejs_team.id,
    github_team.security_team.id
  ])
}

output "security_manager_team_slug" {
  description = "The structural URL/slug name identifier of the security manager team"
  value       = github_team.security_team.slug
}

output "secret_names" {
  description = "A set of plaintext string tracking keys representing configured org secrets"
  value = toset([
    github_actions_organization_secret.api_username.secret_name,
    github_actions_organization_secret.api_password.secret_name
  ])
}

output "base_repository_name" {
  description = "The canonical system name tracking the core base development workspace repository"
  value       = github_repository.tf_github_lab_base_repository.name
}