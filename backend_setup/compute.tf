resource "azurerm_network_interface" "nics" {
  name                = "axion-nic"
  location            = azurerm_resource_group.rgs.location
  resource_group_name = azurerm_resource_group.rgs.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnets.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ips.id
  }
}





resource "azurerm_linux_virtual_machine" "vms" {
  name                            = "selfthostedagentvm"
  resource_group_name             = azurerm_resource_group.rgs.name
  location                        = azurerm_resource_group.rgs.location
  size                            = "Standard_DC1ds_v3"
  admin_username                  = "azureadmin"
  admin_password                  = "Welcome@123456"
  disable_password_authentication = "false"

  network_interface_ids = [azurerm_network_interface.nics.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
