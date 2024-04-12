variable "location" {
  type        = string
  default     = "westeurope"
  description = "default location for resources in identity zone"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for identity zone virtual network"
}

variable "vnet_dns_servers" {
  type        = list(string)
  description = "DNS servers for identity zone virtual network"
}

variable "ad_ds_subnet_address_prefix" {
  type        = string
  description = "Address space for Active Directory Domain Services subnet"
}

variable "allowed_management_networks" {
  type        = list(string)
  description = "List of allowed management networks"
}

# Key vault
variable "keyvault_admins" {
  type        = list(string)
  description = "List of user principal names for key vault administrators"
}

# Domain controllers
variable "domain_controllers" {
  type        = map(any)
  description = "Map of domain controllers"
}

variable "admin_username" {
  type        = string
  default     = "azadm"
  description = "Username for local admin account"
}

variable "ad_ds_vm_size" {
  type        = string
  default     = "Standard_B4ms"
  description = "VM size for Domain Controllers"
}

variable "hub_vnet" {
  type = object({
    resource_group_name = string
    name                = string
    id                  = string
  })
  description = "Hub virtual network for peering"
}

variable "service_connection_name" {
  type        = string
  description = "Name of app registration in Azure AD that is setup as service connection in Azure DevOps"
}