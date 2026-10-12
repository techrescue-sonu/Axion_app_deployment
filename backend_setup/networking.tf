resource "azurerm_virtual_network" "vnets" {
  name                = "axion-vnet"
  location            = azurerm_resource_group.rgs.location
  resource_group_name = azurerm_resource_group.rgs.name
  address_space       = ["10.51.100.0/24"]
}

resource "azurerm_subnet" "subnets" {
  name                 = "axion-subnet"
  resource_group_name  = azurerm_resource_group.rgs.name
  virtual_network_name = azurerm_virtual_network.vnets.name
  address_prefixes     = ["10.51.100.0/24"]
}




resource "azurerm_public_ip" "public_ips" {
  name                = "axion-public-ip"
  location            = azurerm_resource_group.rgs.location
  resource_group_name = azurerm_resource_group.rgs.name
  allocation_method   = "Static"
}
