terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

resource "azurerm_virtual_network_gateway_connection" "hub_to_peer_hub_vpn" {
  name                = "cn-hub-${var.virtual_network_gateway.location}-to-hub-${var.peer_virtual_network_gateway.location}"
  location            = var.virtual_network_gateway.location
  resource_group_name = var.virtual_network_gateway.resource_group_name


  type                            = "Vnet2Vnet"
  virtual_network_gateway_id      = var.virtual_network_gateway.id
  peer_virtual_network_gateway_id = var.peer_virtual_network_gateway.id

  enable_bgp = true
  shared_key = var.vpn_secret

  lifecycle {
    ignore_changes = [
      # Ignore changes to shared key
      shared_key
    ]
  }
}

resource "azurerm_virtual_network_gateway_connection" "peer_hub_to_hub_vpn" {
  name                = "cn-hub-${var.peer_virtual_network_gateway.location}-to-hub-${var.virtual_network_gateway.location}"
  location            = var.peer_virtual_network_gateway.location
  resource_group_name = var.peer_virtual_network_gateway.resource_group_name


  type                            = "Vnet2Vnet"
  virtual_network_gateway_id      = var.peer_virtual_network_gateway.id
  peer_virtual_network_gateway_id = var.virtual_network_gateway.id

  enable_bgp = true
  shared_key = var.vpn_secret

  lifecycle {
    ignore_changes = [
      # Ignore changes to shared key
      shared_key
    ]
  }
}