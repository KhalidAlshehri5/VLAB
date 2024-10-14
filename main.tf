provider "azurerm" {
  features {}

  subscription_id = "f431f07f-c431-42dc-91e4-c13221b48428"
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "VLAB"
  resource_group_name   = "VLAB_group"
  location              = "westus"
  vm_size               = "Standard_B1s"  

  os_profile {
    computer_name       = "VLAB"
    admin_username      = "ubuntuuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
}

resource "azurerm_network_interface" "nic" {
  name                = "VLAB-nic"
  location            = "westus"
  resource_group_name = "VLAB_group"

  ip_configuration {
    name                          = "VLAB-ip"
    subnet_id                     = "/subscriptions/f431f07f-c431-42dc-91e4-c13221b48428/resourceGroups/VLAB_group/providers/Microsoft.Network/virtualNetworks/VLAB-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "VLAB-public-ip"
  location            = "westus"
  resource_group_name = "VLAB_group"
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "VLAB-nsg"
  location            = "westus"
  resource_group_name = "VLAB_group"
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_assoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
