/*
resource "azurerm_resource_group" "blue" {
  name     = "${var.project_name}-${var.my_rg_name}-blue"
  location = var.my_loc

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}



resource "azurerm_resource_group" "red" {
  name     = "${var.project_name}-${var.my_rg_name}-red"
  location = var.my_loc

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }
}

resource "azurerm_resource_group" "orange" {
  name     = "${var.project_name}-${var.my_rg_name}-orange"
  location = var.my_loc

  tags = {
    Owner   = "Amit Vashist"
    Team    = "DevOps"
 }

}
*/


locals { 
  default_name = "${join("-", tolist([var.project_name, var.my_rg_prefix]))}"
}


locals {
  project_tags = { 
    Owner   = "Amit Vashist"
    Team    = "DevOps"
    Env     = "Production"
    Name    = local.default_name
 }
}

resource "azurerm_resource_group" "blue" {
  name     = "${local.default_name}-blue"
  location = var.my_loc
  tags = local.project_tags
}



resource "azurerm_resource_group" "red" {
  name     = "${local.default_name}-red"
  location = var.my_loc

  tags = local.project_tags
}

resource "azurerm_resource_group" "orange" {

  name     = "${local.default_name}-orange"
  location = var.my_loc

  tags = local.project_tags
}
