# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "front" {
  count    = 1 
  name     = "Frontend-RG-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}



resource "azurerm_resource_group" "back" {
  count    = 1 
  name     = "Backend-RG-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
