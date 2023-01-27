variable "my_rg_name" {
  description = "My Resource Group Name" 
  type = string
  default = "myrg"
}


variable "my_loc" { 
  description = "My Resource Group Location" 
  type = list
  default = ["eastus", "westus", "eastus2"]
}