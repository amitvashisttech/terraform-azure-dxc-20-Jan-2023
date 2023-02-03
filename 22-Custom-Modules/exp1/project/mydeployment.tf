module "mynet" {
  source = "../modules/network"
}


module "network" {
  source             = "../modules/network"
  my_rg_name         = "devops"
  my_loc             = "eastus"
  my_vpc_cidr        = ["192.168.0.0/16"]
  my_vpc_subnet_cidr = ["192.168.1.0/24"]
  my_vm_count        = 3

}


module "compute" {
  source             = "../modules/compute"
  my_rg_name         = "devops"
  my_loc             = "eastus"
  my_vm_count        = 3
  my_nic_id          = module.network.my_nic 
}


