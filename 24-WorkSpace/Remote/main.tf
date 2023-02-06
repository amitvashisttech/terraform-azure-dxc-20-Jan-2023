# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  count    = lookup(var.rg_count, terraform.workspace)
  name     = "${var.rg_name}-${terraform.workspace}-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
    Project = "Terraform Automaction - ${terraform.workspace}"
 }
}
