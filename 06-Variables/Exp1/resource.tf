variable "my_rg_name" { 
  type = string
  default = "myrg"
}


variable "my_loc" { 
  type = string
  default = "eastus"
}




resource "azurerm_resource_group" "rg" {
  count    = 1 
  name     = "${var.my_rg_name}-${count.index +1}"
  location = var.my_loc

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}
