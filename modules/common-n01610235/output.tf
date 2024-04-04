output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.common_log_analytics_workspace.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.common_recovery_services_vault.name
}

output "storage_account_name" {
  value = azurerm_storage_account.common_storage_account.name
}

output "storage_account_uri" {
  value = azurerm_storage_account.common_storage_account.primary_blob_endpoint
}