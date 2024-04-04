resource "azurerm_resource_group" "network-rg" {
  name     = var.network_rg_name
  location = var.location
  tags     = var.common_tags
}