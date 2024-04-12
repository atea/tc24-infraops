terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

resource "azurerm_local_network_gateway" "on_premises" {
  name                = "lgw-${var.org_name}-${var.lgw_name}"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  gateway_address = var.gateway_address
  address_space   = var.address_space
}

resource "azurerm_virtual_network_gateway_connection" "site_vpn" {
  name                       = "cn-lgw-${var.org_name}-${var.lgw_name}-${var.virtual_network_gateway.name}"
  resource_group_name        = var.resource_group.name
  location                   = var.resource_group.location
  type                       = "IPsec"
  virtual_network_gateway_id = var.virtual_network_gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.on_premises.id
  dpd_timeout_seconds        = 45


  ipsec_policy {
    dh_group         = var.ipsec_policy.dh_group
    ike_encryption   = var.ipsec_policy.ike_encryption
    ike_integrity    = var.ipsec_policy.ike_integrity
    ipsec_encryption = var.ipsec_policy.ipsec_encryption
    ipsec_integrity  = var.ipsec_policy.ipsec_integrity
    pfs_group        = var.ipsec_policy.pfs_group
    sa_lifetime      = var.ipsec_policy.sa_lifetime
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes to shared key
      shared_key
    ]
  }
}

