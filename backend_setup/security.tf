resource "azurerm_network_security_group" "nsgs" {
  name                = "vm-nsg"
  location            = azurerm_resource_group.rgs.location
  resource_group_name = azurerm_resource_group.rgs.name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  subnet_id                 = azurerm_subnet.subnets.id
  network_security_group_id = azurerm_network_security_group.nsgs.id
}