data "github_organization_roles" "all_roles" {}

data "github_organization" "current" {
  name = local.org_name
}