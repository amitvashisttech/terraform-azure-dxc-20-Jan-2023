# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "front" {
  count    = 1 
  name     = "Frontend-RG-${count.index +1}"
  #name     = "Frontend-rg"
  location = "eastus"
  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }


  lifecycle { 
   create_before_destroy = true 
  }
}

