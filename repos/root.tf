terraform {}

provider "github" {
  owner = data.terraform_remote_state.base.outputs.organization_name
  token = var.gh_token
}