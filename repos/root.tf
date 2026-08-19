terraform {}

provider "github" {
  owner = "{organization_name}"
  token = var.gh_token
}