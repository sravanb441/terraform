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
