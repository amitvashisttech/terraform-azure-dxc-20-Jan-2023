# Create SSH Key
resource "tls_private_key" "example_ssh" { 
   algorithm = "RSA"
   rsa_bits = 4096
}


resource "local_file" "write_private_key" { 
   content = tls_private_key.example_ssh.private_key_pem
   filename = "${path.root}/.terrform/.ssh/admin_rsa"
   file_permission = 0600
}


resource "local_file" "write_public_key" { 
   content = tls_private_key.example_ssh.public_key_openssh
   filename = "${path.root}/.terrform/.ssh/admin_rsa.pub"
   file_permission = 0600
}


resource "azurerm_linux_virtual_machine" "main" {
  name                  = "example-vm"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  #delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  #delete_data_disks_on_termination = true

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  
  os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
    computer_name  = "mytestvm"
    disable_password_authentication = true
    admin_username = "testadmin"

   admin_ssh_key { 
    username = "testadmin"
    public_key = tls_private_key.example_ssh.public_key_openssh
   }

  tags = {
    environment = "dev"
  }
}
