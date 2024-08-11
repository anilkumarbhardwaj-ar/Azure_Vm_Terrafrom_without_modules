resource "azurerm_resource_group" "rgname" {
    name = "rg-admin"
    location = "Central India"
  
}

resource "azurerm_public_ip" "pipblock" {
    for_each = var.anil
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rgname.name
  location            = azurerm_resource_group.rgname.location
  allocation_method   = "Static"
}


resource "azurerm_virtual_network" "vnetblock" {
  name                = "anil-vnet1"
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  address_space       = ["10.0.0.0/16"]
 
}

resource "azurerm_subnet" "subnet_block" {
    for_each = var.subnet
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.rgname.name
  virtual_network_name = azurerm_virtual_network.vnetblock.name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_network_interface" "nic_block" {
    for_each = var.nic
  name                = each.value.name
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.ip_configuration.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = each.value.ip_configuration.public_ip_address_id
  }
}

resource "azurerm_windows_virtual_machine" "winmachine" {
    for_each = var.winvm
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rgname.name
  location            = azurerm_resource_group.rgname.location
  size                = "Standard_F2"
  admin_username      = "adminarati"
  admin_password      = "Arati@12345!"
  network_interface_ids = [
    each.value.network_interface_ids
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}