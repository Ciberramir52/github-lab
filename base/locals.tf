locals {
  billing_email       = "ramiro.pavo@gmail.com"
  org_name            = "close-dreamers-lab"
  description         = "${local.org_name} organization for GitHub terraform lab"
  security_manager_id = one([for x in data.github_organization_roles.all_roles.roles : x.role_id if x.name == "security_manager"])
}