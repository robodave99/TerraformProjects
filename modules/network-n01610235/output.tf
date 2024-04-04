output "virtual_network_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "address_space" {
  value = azurerm_virtual_network.network-vnet.address_space
}

output "subnet_name" {
  value = azurerm_subnet.network-subnet.name
}

output "subnet_address" {
  value = azurerm_subnet.network-subnet.address_prefixes
}

output "subnet_id" {
  value = azurerm_subnet.network-subnet.id
}

output "network_nsg_name" {
  value = azurerm_network_security_group.network-nsg.name
}