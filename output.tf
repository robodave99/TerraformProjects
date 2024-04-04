output "resource_group_name" {
  value = module.rgroup-n01610235.network_rg
}

output "location" {
  value = module.rgroup-n01610235.location
}

output "virtual_network_name" {
  value = module.network-n01610235.virtual_network_name
}

output "address_space" {
  value = module.network-n01610235.address_space
}

output "subnet_name" {
  value = module.network-n01610235.subnet_name
}

output "subnet_address" {
  value = module.network-n01610235.subnet_address
}

output "network_nsg_name" {
  value = module.network-n01610235.network_nsg_name
}

output "log_analytics_workspace_name" {
  value = module.common-n01610235.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common-n01610235.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common-n01610235.storage_account_name
}

output "linux_hostname" {
  value = module.vmlinux-n01610235.linux_hostname
}

output "linux_FQDN" {
  value = module.vmlinux-n01610235.linux_FQDN
}

output "linux_private_ip_address" {
  value = module.vmlinux-n01610235.linux_private_ip_address
}

output "linux_public_ip_address" {
  value = module.vmlinux-n01610235.linux_public_ip_address
}

output "windows_hostnames" {
  value = module.vmwindows-n01610235.windows_hostnames
}

output "windows_FQDN" {
  value = module.vmwindows-n01610235.windows_FQDN
}

output "windows_private_ip_address" {
  value = module.vmwindows-n01610235.windows_private_ip_address
}

output "windows_public_ip_address" {
  value = module.vmwindows-n01610235.windows_public_ip_address
}

output "datadisk_name" {
  value = module.datadisk-n01610235.datadisk_name
}

output "loadbalancer_name" {
  value = module.loadbalancer-n01610235.loadbalancer_name
}

output "database_name" {
  value = module.database-n01610235.database_name
}