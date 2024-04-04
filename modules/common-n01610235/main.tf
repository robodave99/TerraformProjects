resource "azurerm_log_analytics_workspace" "common_log_analytics_workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.network_rg_name
  sku                 = "PerGB2018"
  tags                = var.common_tags
}

resource "azurerm_recovery_services_vault" "common_recovery_services_vault" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.network_rg_name
  sku                 = "Standard"
  tags                = var.common_tags
}

resource "azurerm_storage_account" "common_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.network_rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.common_tags
}