resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "eastus"

  tags = { 
    Owner = "AV" 
  }
}

# Create a virtual network 
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Production"
  }
}

# Create a Subnets 

## Internal Subnet

resource "azurerm_subnet" "internal" {
  name                 = "internal-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.7.0/24"]
}



## External Subnet

resource "azurerm_subnet" "external" {
  name                 = "external-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}


## Network Interface 

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}


## Public IP Config 

resource "azurerm_public_ip" "example" {
  name                = "myPublicIP"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Dynamic"

  tags = { 
    environment = "Dev"
  }
}


## NSG 

resource "azurerm_network_security_group" "example" {
  name                = "myTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  dynamic  "security_rule" {
  for_each                     = local.nsgrules
  content { 
    name                       = security_rule.value.name
    priority                   = security_rule.value.priority
    direction                  = security_rule.value.direction
    access                     = security_rule.value.access
    protocol                   = security_rule.value.protocol
    source_port_range          = security_rule.value.source_port_range
    destination_port_range     = security_rule.value.destination_port_range
    source_address_prefix      = security_rule.value.source_address_prefix
    destination_address_prefix = security_rule.value.destination_address_prefix
  }
 }

  tags = {
    environment = "Dev"
  }
}


## NSG Assocation 

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}



## NSG 
/*
resource "azurerm_network_security_group" "example" {
  name                = "myTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

}

resource "azurerm_network_security_rule" "testrules" {
  for_each                     = local.nsgrules
    name                       = each.key
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
    resource_group_name = azurerm_resource_group.example.name
    network_security_group_name = azurerm_network_security_group.example.name
  }

*/
