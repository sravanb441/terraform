# azure service principal info
variable azure {
  default = {
    subscription_id   = "9c249f9f-804a-4390-8b81-4b2c3dc2a75e"
    tenant_id         = "d03c900d-9a0e-4be6-82ab-c674f80ef1c8"
    client_id         = "42d37d77-60a7-431e-b5d7-6e5581ae6b71"
    client_secret     = "xrc7Q~sP1HMRFuJ3jmzY7E5Ui_ym05v4eJznU"
  }
}
variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = false
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = "Terraform-resources"
}
variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East US"
}
variable "storage_account_name" {
  description = "The name of the azure storage account"
  default     = ""
}
variable "name" {
  description = "Name of storage account. Unless var.exact_name is true any illegal characters (,-_ etc) will be truncated and 6 random characters will be appended to this value."
  type        = string
}

variable "exact_name" {
  description = "When true, var.name is used exactly as passed"
  type        = bool
  default     = false
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  default     = "ZRS"
}