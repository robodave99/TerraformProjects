terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01610235RG"
    storage_account_name = "tfstaten01610235psa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}