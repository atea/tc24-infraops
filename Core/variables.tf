variable "root_id" {
  type    = string
  default = "myorg"
}

variable "root_name" {
  type    = string
  default = "My Organization"
}

variable "default_location" {
  type    = string
  default = "norwayeast"
}
variable "connectivity_subscription_id" {
  type = string
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = false
}

variable "deploy_ne_hub" {
  type    = bool
  default = false
}

variable "connectivity_ne_resources_location" {
  type    = string
  default = "norwayeast"
}

variable "connectivity_ne_address_space" {
  type    = list(string)
  default = null
}

variable "connectivity_ne_subnets" {
  type = list(object({
    name           = string
    address_prefixes = string
  }))
  default = []
}

variable "connectivity_ne_vpngw_enabled" {
  type    = bool
  default = false
}

variable "connectivity_ne_vpngw_sku" {
  type    = string
  default = "VpnGw1"
}

variable "connectivity_ne_vpngw_address_space" {
  type    = string
  default = null
}


variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    "created-by-terraform" = true
    "costcenter"           = "130"
  }
}


##Identity
variable "identity_subscription_id" {
  type    = string
  default = null
}

variable "deploy_identity_resources" {
  type    = bool
  default = false
}

variable "management_subscription_id" {
  type    = string
  default = null
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
  type    = string
  default = null
}


##Management
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
  type        = list(string)
  description = "List of subscription IDs that are decommissioned"
  default     = null
}


# # Identity zone settings
# variable "identity_vnet_address_space" {
#   type        = list(string)
#   description = "Address space for identity zone virtual network"
# }

# variable "ad_ds_subnet_address_prefix" {
#   type        = string
#   description = "Address space for Active Directory Domain Services"
# }

# variable "allowed_management_networks" {
#   type        = list(string)
#   description = "List of allowed management networks"
# }

# variable "keyvault_admins" {
#   type        = list(string)
#   description = "List of user principal names that will get admin access to identity zone key vault"
# }