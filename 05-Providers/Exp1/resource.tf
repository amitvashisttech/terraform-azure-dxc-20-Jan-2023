resource "azurerm_resource_group" "rg" {
  count    = 1 
  name     = "Apple-RG-${count.index +1}"
  location = "eastus"

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
