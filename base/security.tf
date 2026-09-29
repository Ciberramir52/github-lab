resource "github_team" "security_team" {
  name        = "security-team"
  privacy     = "closed"
  description = "Organization Security Management Team"
}

resource "github_organization_role_team" "org_security_mgr" {
  role_id   = local.security_manager_id
  team_slug = github_team.security_team.slug
}