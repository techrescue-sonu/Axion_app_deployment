# data "azurerm_key_vault_secret" "keyvault_secret" {
#    for_each = var.keyvault
#   name         = each.value.keyvaultsecret
#   key_vault_id = data.azurerm_key_vault.keyvault[each.key].keyvault_name
# }

# data "azurerm_key_vault" "keyvault" {
#   for_each = var.keyvault
#   name                = each.value.keyvault_name
#   resource_group_name = each.value.resource_group_name
# }

data "azurerm_key_vault" "keyvault" {
  name                = "axionkeyvaultsonu"
  resource_group_name = "sonu-axion-rg"
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = "secret"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}