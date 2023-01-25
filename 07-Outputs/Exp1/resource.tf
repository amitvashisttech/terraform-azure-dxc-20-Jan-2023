resource "azurerm_resource_group" "rg" {
  name     = "Apple-RG"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
