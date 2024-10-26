اتمتة


provider "azurerm" {
  features {}
    subscription_id = "4ece3f7f-2ce6-47d4-8485-a4c76438f535"
}


resource "azurerm_resource_group" "example" {
  name     = "VLAB_group"
  location = "West US"
}

resource "azurerm_virtual_network" "example" {
  name                = "VLAB_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "VLAB_public_ip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"  
  sku                 = "Standard"  
}

}

resource "azurerm_network_security_group" "example" {
  name                = "VLAB665-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.example.name
}

resource "azurerm_network_interface" "example" {
  name                = "VLAB665"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                  = "VLAB"
  resource_group_name   = azurerm_resource_group.example.name
  location              = azurerm_resource_group.example.location
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.example.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwVrEKjflvqLw/hA/D0RZ7kTOyO3Z8O2OYfIXtdL5bSVEfNyh25GRwPZYJGMmcaQ1v7FwEBqkBDp3vyeFencgk3tABKRCDaQagCPTbwdD55TBM1rHVMo9mY0nG5hlIu/miSdz2FhGXbrDXiIREuJ+NQG1yHnBp3722bVEzDnf+ocukiYv9aRp2qb8xY9Koap7/pJ+k3hDospdmPYnXAbZJY4FtLeyFCDWMafC5iJnJx16kFMX7DM82u/nmku7JJCNW5X75N9t5FTnMpvwiu8O6smivUqoOpDcs+9lCZVBVJJPy6n+vS3AYdOQ4ewG8HVhs9gqIMdVtJnAQr+dbxVsXrn/ixtV5HoSOMI4SmqY0oy2OtBV33HaPPOf0rcnqtAhP7wGfYBt3qcn3vz4t9ToC/ftZtQUiFv5iG80FXkbyhCZcqsBi7T0JlrUxIgZhgUDfxtKUmx8UBHB9e9kK9H75DsTspMqEcUergYeTwMwI2UrP+OM7GoRiFBrWqDOTmyJ78fOzFmIF2m7sop52YmYMCtK5xwQm5/Z133INMAKzKWTiqGyZDrXc88Uf7J8MeA27PyQY+d53BT/YDcMEbQxLk2fC1qZV28OqmIaIJQXpUiG7TW48jxCzpFRJesfMMPJnw2yZb5HcwmxgYQUu0Mynm8alyLVGCKRfcQ461whvvQ== azureuser@vlab.com"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
