resource "azurerm_resource_group" "rgs" {
  name     = "sonu-axion-rg"
  location = "westus"
}

resource "azurerm_storage_account" "sa" {
  name                     = "axionstorageaccountsonu1"
  resource_group_name      = azurerm_resource_group.rgs.name
  location                 = azurerm_resource_group.rgs.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc" {
  name                  = "axion-container"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}




