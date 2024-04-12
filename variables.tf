variable "root_id" {
  type    = string
  default = "myorg"
}

variable "root_name" {
  type    = string
  default = "My Organization"
}

variable "connectivity_subscription_id" {
  type = string
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = false
}

variable "connectivity_resources_location" {
  type    = string
  default = "westeurope"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    "created-by-terraform" = true
    "costcenter"           = "130"
  }
}

variable "identity_subscription_id" {
  type    = string
  default = ""
}

variable "deploy_identity_resources" {
  type    = bool
  default = false
}

variable "management_subscription_id" {
  type    = string
  default = ""
}

variable "deploy_management_resources" {
  type    = bool
  default = false
}

variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type = string
}

variable "management_resources_location" {
  type    = string
  default = "westeurope"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    "created-by-terraform" = true
    "costcenter"           = "130"
  }
}

variable "decommissioned_subscription_ids" {
  type = list(string)
}

/* # Site-Site VPN
variable "local_network_gateway_address" {
  type        = string
  description = "The IP address of the on-premises VPN appliance"
}

variable "local_network_address_space" {
  type        = list(string)
  description = "List of address spaces of the on-premises networks"
}

# Identity zone settings
variable "identity_vnet_address_space" {
  type        = list(string)
  description = "Address space for identity zone virtual network"
}

variable "ad_ds_subnet_address_prefix" {
  type        = string
  description = "Address space for Active Directory Domain Services"
}

variable "allowed_management_networks" {
  type        = list(string)
  description = "List of allowed management networks"
}

variable "keyvault_admins" {
  type        = list(string)
  description = "List of user principal names that will get admin access to identity zone key vault"
}

variable "decommissioned_subscription_ids" {
  type        = list(string)
  description = "List of subscription IDs that are decommissioned"
}

variable "service_connection_name" {
  type        = string
  description = "Name of app registration in Azure AD that is setup as service connection in Azure DevOps"
} */