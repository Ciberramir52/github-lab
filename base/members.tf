resource "github_team" "devops_team" {
  name        = "devops-team"
  privacy     = "secret"
  description = "Managed DevOps Engineering Team"
}

resource "github_team" "nodejs_team" {
  name        = "nodejs-team"
  privacy     = "secret"
  description = "Managed Node.js Engineering Team"
}

resource "github_membership" "colleague_org_membership" {
  username = "octocat"
  role     = "member"
}

resource "github_team_membership" "colleague_team_assignment" {
  team_id  = github_team.devops_team.id
  username = github_membership.colleague_org_membership.username
  role     = "member"
}