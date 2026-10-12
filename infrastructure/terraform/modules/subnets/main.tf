resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  address_prefixes     = each.value.address_prefixes
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_network_security_group" "nsg_data" {
  for_each            = var.subnets
  name                = each.value.nsg_name
  resource_group_name = azurerm_subnet.subnets[each.key].resource_group_name
}


resource "azurerm_subnet_network_security_group_association" "association" {
  for_each                  = var.subnets
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_data[each.key].id
}