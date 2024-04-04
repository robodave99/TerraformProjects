module "rgroup-n01610235" {
  source = "./modules/rgroup-n01610235"

  network_rg_name = "N01610235-RG"
  location        = "Canada Central"
  common_tags     = var.common_tags
}

module "network-n01610235"{
  source = "./modules/network-n01610235"

  network_rg_name               = module.rgroup-n01610235.network_rg
  location                      = module.rgroup-n01610235.location
  virtual_network_name          = "N01610235-VNET"
  virtual_network_address_space = ["10.0.0.0/16"]
  subnet_name                   = "N01610235-SUBNET"
  subnet_address                = ["10.0.0.0/24"]
  network_security_group_name   = "N01610235-NSG"
  common_tags                   = var.common_tags
}

module "common-n01610235" {
  source = "./modules/common-n01610235"

  location                     = module.rgroup-n01610235.location
  network_rg_name              = module.rgroup-n01610235.network_rg
  log_analytics_workspace_name = "N01610235-log-analytics-workspace"
  recovery_services_vault_name = "N01610235-recovery-service-vault"
  storage_account_name         = "n01610235sa"
  common_tags                  = var.common_tags
}

module "vmlinux-n01610235" {
  source = "./modules/vmlinux-n01610235"

  linux_name = { "n01610235-c-vm1" : "Standard_B1ms",
    "n01610235-c-vm2" : "Standard_B1ms",
    "n01610235-c-vm3" : "Standard_B1ms" }
  vm_size                      = "Standard_B1ms"
  admin_username               = "oladapo"
  public_key_path              = "/home/oladapo/.ssh/id_rsa.pub"
  private_key_path             = "/home/oladapo/.ssh/id_rsa"
  os_disk_storage_account_type = "Standard_LRS"
  os_disk_size                 = 32
  os_disk_caching              = "ReadWrite"
  os_publisher                 = "OpenLogic"
  os_offer                     = "CentOS"
  os_sku                       = "8_2"
  os_version                   = "latest"
  linux_avs                    = "n01610235-linux-avs"
  location                     = module.rgroup-n01610235.location
  network_rg_name              = module.rgroup-n01610235.network_rg
  subnet_id                    = module.network-n01610235.subnet_id
  storage_account_uri          = module.common-n01610235.storage_account_uri
  common_tags                  = var.common_tags
}

module "vmwindows-n01610235" {
  source = "./modules/vmwindows-n01610235"

  windows_admin_username               = "oladapo"
  windows_admin_password               = "ColdCodes99!"
  windows_os_disk_storage_account_type = "StandardSSD_LRS"
  windows_os_disk_size                 = 128
  windows_os_disk_caching              = "ReadWrite"
  windows_os_publisher                 = "MicrosoftWindowsServer"
  windows_os_offer                     = "WindowsServer"
  windows_os_sku                       = "2016-Datacenter"
  windows_os_version                   = "latest"
  windows_avs                          = "n01610235-windows-avs"
  windows_name                         = "n01610235-w-vm"
  windows_size                         = "Standard_B1ms"
  network_rg_name                      = module.rgroup-n01610235.network_rg
  location                             = module.rgroup-n01610235.location
  subnet_id                            = module.network-n01610235.subnet_id
  nb_count                             = 1
  common_tags                          = var.common_tags
}

module "datadisk-n01610235" {
  source = "./modules/datadisk-n01610235"

  vm_ids          = concat(module.vmlinux-n01610235.linux_id, module.vmwindows-n01610235.windows_id)
  network_rg_name = module.rgroup-n01610235.network_rg
  location        = module.rgroup-n01610235.location
  common_tags     = var.common_tags
}

module "loadbalancer-n01610235" {
  source = "./modules/loadbalancer-n01610235"

  linux_vm_ids   = module.vmlinux-n01610235.linux_id
  linux_nic_ids  = module.vmlinux-n01610235.linux_nic_id
  linux_hostname = module.vmlinux-n01610235.linux_hostname
  resource_group = module.rgroup-n01610235.network_rg
  location       = module.rgroup-n01610235.location
  common_tags    = var.common_tags
}

module "database-n01610235" {
  source = "./modules/database-n01610235"

  network_rg_name = module.rgroup-n01610235.network_rg
  location        = module.rgroup-n01610235.location
  server_name     = "n01610235-postgresql-server"
  admin_username  = "sqladmin"
  admin_password  = "ColdCodes99!"
  database_name   = "n01610235-database"
  common_tags     = var.common_tags
}