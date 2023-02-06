variable "rg_name" {
 default = "Test-RG"
}

variable "rg_count" { 
  type = map 
   default = { 
      default = "1"
      uat     = "2"
      prod    = "5"
   }

}
