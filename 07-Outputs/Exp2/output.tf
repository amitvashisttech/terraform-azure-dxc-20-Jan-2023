output "my_rg_name" { 
  value = azurerm_resource_group.rg.*.name 
}



output "my_loc" { 
  value = azurerm_resource_group.rg.*.location
}



output "my_rg_id" { 
  value = azurerm_resource_group.rg.*.id 
}



output "my_fisrt_rg_name" { 
  value = azurerm_resource_group.rg.0.name 
}
