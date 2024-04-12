terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
      configuration_aliases = [
        azurerm.connectivity
      ]
    }
  }
}

data "azurerm_client_config" "core" {}

locals {
  mandatory_tags = {
  }
}

data "azurerm_virtual_network" "hub_vnet" {
  count = var.hub_vnet_name ? 1 : 0
  provider            = azurerm.connectivity
  name                = var.hub_vnet_name
  resource_group_name = var.hub_vnet_resource_group_name
}

resource "azurerm_resource_group" "network" {
  name     = "rg-${lower(var.landingzone_name)}-${var.environment}-network"
  location = var.location

  tags = local.mandatory_tags
}

resource "azurerm_network_security_group" "spoke" {
  name                = "nsg-${lower(var.landingzone_name)}-${var.environment}"
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location

  tags = local.mandatory_tags
}

resource "azurerm_virtual_network" "spoke" {
  name                = "vnet-${lower(var.landingzone_name)}-${var.environment}"
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location

  address_space = var.vnet_address_space

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.key
      address_prefix = subnet.value.address_prefix
      security_group = azurerm_network_security_group.spoke.id
    }
  }

  tags = local.mandatory_tags
}

resource "azurerm_route_table" "spoke" {
  name                = "rt-${lower(var.landingzone_name)}-${var.environment}"
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location

  tags = local.mandatory_tags
}

/*
  This lookup is required because subnets created with azurerm_virtual_network doe not have a named index,
  they can only be referenced by their positional index
*/
data "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.spoke.name
  resource_group_name  = azurerm_virtual_network.spoke.resource_group_name
}

resource "azurerm_subnet_route_table_association" "spoke" {
  for_each       = data.azurerm_subnet.subnets
  subnet_id      = data.azurerm_subnet.subnets[each.key].id
  route_table_id = azurerm_route_table.spoke.id
}

resource "azurerm_virtual_network_peering" "spoke_hub" {
  name                      = "${lower(var.landingzone_name)}-hub"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.spoke.name
  remote_virtual_network_id = data.azurerm_virtual_network.hub_vnet.id

  use_remote_gateways     = true
  allow_forwarded_traffic = true
}


resource "azurerm_virtual_network_peering" "hub_spoke" {
  count                     = var.hub_vnet_name ? 1 : 0
  provider                  = azurerm.connectivity
  name                      = "hub-${lower(var.landingzone_name)}"
  resource_group_name       = data.azurerm_virtual_network.hub_vnet.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.spoke.id

  allow_gateway_transit = true
}