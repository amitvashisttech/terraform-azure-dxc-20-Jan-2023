# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  count    = 1
  name     = "Chery-RG-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
