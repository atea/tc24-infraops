variable "virtual_network_gateway" {
  type = object({
    name                = string
    id                  = string
    location            = string
    resource_group_name = string
  })
  description = "Virtual Network Gateway in Azure for secondary location"
}

variable "peer_virtual_network_gateway" {
  type = object({
    name                = string
    id                  = string
    location            = string
    resource_group_name = string
  })
  description = "Virtual Network Gateway in Azure for secondary location"
}


variable "ipsec_policy" {
  type = object({
    dh_group         = string
    ike_encryption   = string
    ike_integrity    = string
    ipsec_encryption = string
    ipsec_integrity  = string
    pfs_group        = string
  })
  default = {
    dh_group         = "DHGroup2"
    ike_encryption   = "AES256"
    ike_integrity    = "SHA256"
    ipsec_encryption = "AES256"
    ipsec_integrity  = "SHA256"
    pfs_group        = "None"
  }
  description = "IPsec policy for Site-Site VPN"
}

variable "vpn_secret" {
  type        = string
  description = "Shared Key for V2V Connection"
  sensitive   = true
}