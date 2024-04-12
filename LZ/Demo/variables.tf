variable "root_id" {
  type        = string
  description = "Used by Azure Landing Zones-module for naming management groups and resources"
}

variable "root_name" {
  type        = string
  description = "Used by Azure Landing Zones-module for naming management groups and resources"
}

variable "azuread_group_owner" {
  type        = string
  description = "UserPrincipalName / Email address for user in Azure AD that will be set as Owner for access groups"
}

variable "landing_zone_name" {
  type        = string
  description = "Name of the Landing Zone"
}

variable "landing_zone_subscription_ids" {
  type        = list(string)
  description = "List of subscription IDs for the IT Landing Zone(s)"
}

# variable "hub_vnet_name" {
#   type = string
# }

# variable "hub_resource_group" {
#   type = string
# }

# variable "hub_network_ids" {
#   type = list(string)
# }

# variable "vnet_address_space" {
#   type = list(string)
# }

# variable "vnet_subnets" {
#   type = map(any)
# }

# variable "connectivity_subscription_id" {
#   type = string
# }

variable "enviroment" {
  type    = string
  default = "test"
}

variable "resource_location" {
  type    = string
  default = "norwayeast"
}