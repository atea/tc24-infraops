variable "landingzone_name" {
  type        = string
  description = "Name of Landing Zone. Typically a project name, or department"
}
variable "environment" {
  type        = string
  description = "Name of environment. Typically dev, test, prod"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Azure region for resources"
}

variable "hub_vnet_name" {
  type        = string
  description = "Name of Hub VNET used for VNET peering"
  default     = null
}

variable "hub_vnet_resource_group_name" {
  type        = string
  description = "Name of resource group where hub vnet is located"
  default     = null
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for Spoke virtual network"
}

variable "subnets" {
  type        = map(object({
    address_prefix = string
  }))
  description = "Subnets to create in Spoke virtual network"
}