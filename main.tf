terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=2.91.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "Terraform" {
  name     = "Terraform-resources"
  location = "East US"
}

# Create a virtual network in the production-resources resource group
resource "azurerm_virtual_network" "Terraform" {
  name                = "Terraform-network"
  resource_group_name = azurerm_resource_group.Terraform.name
  location            = azurerm_resource_group.Terraform.location
  address_space       = ["10.0.0.0/16"]
}
# create a storage account

resource "azurerm_storage_account" "Terraform" {
  name                     = "terraformstorage"
  resource_group_name      = azurerm_resource_group.Terraform.name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

data "azurerm_storage_account_sas" "Terraform" {
  connection_string = azurerm_storage_account.Terraform.primary_connection_string
  https_only        = true
  signed_version    = "2017-07-29"

  resource_types {
    service   = true
    container = false
    object    = false
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = "2022-03-10T00:00:00Z"
  expiry = "2023-03-21T00:00:00Z"

  permissions {
    read    = true
    write   = true
    delete  = false
    list    = false
    add     = true
    create  = true
    update  = false
    process = false
  }
}
