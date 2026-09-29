data "terraform_remote_state" "base" {
  backend = "local"

  config = {
    path = "${path.module}/../base/terraform.tfstate"
  }
}

data "github_organization" "current_org" {
  name = data.terraform_remote_state.base.outputs.organization_name
}