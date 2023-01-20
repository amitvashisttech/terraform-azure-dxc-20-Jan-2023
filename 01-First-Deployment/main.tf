# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}




# Create a resource group
resource "azurerm_resource_group" "blue" {
  name     = "Blue-RG"
  location = "eastus"
}


# Create a resource group
resource "azurerm_resource_group" "red" {
  name     = "Red-RG"
  location = "eastus"
}
