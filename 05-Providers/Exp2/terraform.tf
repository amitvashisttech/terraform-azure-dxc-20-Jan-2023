terraform { 
  required_providers { 
   azurerm = {
     source = "hashicorp/azurerm"
     #version = "=2.97.0"
     version = ">=2.40, <=2.48"
   }
 }
}
