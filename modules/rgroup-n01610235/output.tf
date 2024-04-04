output "network_rg" {
  value = azurerm_resource_group.network-rg.name
}

output "location" {
  value = azurerm_resource_group.network-rg.location
}