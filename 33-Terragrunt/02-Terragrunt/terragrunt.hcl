remote_state {
  backend = "azurerm"
  config = {
    resource_group_name = "tstate"
    key     = "terragrunted/${path_relative_to_include()}.tfstate"
    storage_account_name = "tstate16120"
    container_name       = "tstate"
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
  features {}
}

terraform { 
  required_providers { 
   azurerm = {
     source = "hashicorp/azurerm"
     #version = "=2.97.0"
   }
 }

  backend "azurerm" {
  }

 
}
EOF
}



locals {
  # Automatically load environment-level variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load site-level variables
  site_vars = read_terragrunt_config(find_in_parent_folders("site.hcl"))

}



inputs = merge(
  local.env_vars.locals,
  local.site_vars.locals,
)
