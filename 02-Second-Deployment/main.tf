# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "orange" {
  name     = "orange-RG"
  location = "eastus"

 tags = { 
  Owner  = "Amit Vashist" 
  Team   = "DevOps" 
  Project = "TF Automation"
 }
}



# Create a resource group
resource "azurerm_resource_group" "a" {
  name     = "Red-RG"
  location = "eastus"

 tags = { 
  Owner  = "Amit Vashist" 
  Team   = "DevOps" 
  Project = "TF Automation"
 }
}
