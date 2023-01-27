# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


/*
# Create a resource group
resource "azurerm_resource_group" "mango" {
  name     = "mango-RG"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
    Project = "TF Automation"
  }
}



# Create a resource group
resource "azurerm_resource_group" "a" {
  name     = "apple-RG"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
    Project = "TF Automation"
  }
}
*/


resource "azurerm_resource_group" "rg" {
  count    = 3 
  name     = "Apple-RG-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
