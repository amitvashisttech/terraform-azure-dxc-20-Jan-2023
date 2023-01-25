resource "azurerm_resource_group" "rg" {
  count    = length(var.my_loc) 
  name     = "${var.my_rg_name}-${count.index +1}"
  location = var.my_loc[count.index]

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
