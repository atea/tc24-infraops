variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "The resource group for VPN resources"
}

variable "org_name" {
  type = string
}

variable "virtual_network_gateway" {
  type = object({
    id   = string
    name = string
  })
  description = "Virtual Network Gateway in Azure"
}

variable "vpn_secret" {
  type        = string
  description = "Shared Key for V2V Connection"
  sensitive   = true
}

variable "lgw_name" {
  type        = string
  description = "Name of location for Local Network Gateway"
}

variable "gateway_address" {
  type        = string
  description = "The IP address of the on-premises VPN appliance"
}

variable "address_space" {
  type        = list(string)
  description = "The address space of the on-premises networks"
}

variable "ipsec_policy" {
  type = object({
    dh_group         = string
    ike_encryption   = string
    ike_integrity    = string
    ipsec_encryption = string
    ipsec_integrity  = string
    pfs_group        = string
    sa_lifetime      = string
  })
  default = {
    dh_group         = "DHGroup2"
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    ipsec_encryption = "AES256"
    ipsec_integrity  = "SHA256"
    pfs_group        = "None"
    sa_lifetime      = 27000
  }
  description = "IPsec policy for Site-Site VPN"
}