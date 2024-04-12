resource "azurerm_resource_group" "network" {
  name     = "rg-identity-network"
  location = var.location

  tags = local.tags
}

resource "azurerm_application_security_group" "ad_ds" {
  name                = "asg-ad-ds"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

  tags = local.tags
}

resource "azurerm_network_security_group" "ad_ds" {
  name                = "nsg-ad-ds"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

  security_rule {
    name                    = "in_allow_management"
    priority                = 100
    direction               = "Inbound"
    access                  = "Allow"
    protocol                = "*"
    source_port_range       = "*"
    destination_port_range  = "3389"
    source_address_prefixes = var.allowed_management_networks
    destination_application_security_group_ids = [
      azurerm_application_security_group.ad_ds.id
    ]
  }

  security_rule {
    name              = "in_allow_ad_ds_tcp"
    priority          = "200"
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Tcp"
    source_port_range = "*"
    destination_port_ranges = [
      "53",
      "88",
      "135",
      "139",
      "389",
      "445",
      "464",
      "636",
      "3268-3269",
      "5985",
      "40152-65535",
    ]
    source_address_prefix = "*"
    destination_application_security_group_ids = [
      azurerm_application_security_group.ad_ds.id
    ]
  }

  security_rule {
    name              = "in_allow_ad_ds_udp"
    priority          = "201"
    direction         = "Inbound"
    access            = "Allow"
    protocol          = "Udp"
    source_port_range = "*"
    destination_port_ranges = [
      "53",
      "88",
      "123",
      "389",
      "464",
    ]
    source_address_prefix = "*"
    destination_application_security_group_ids = [
      azurerm_application_security_group.ad_ds.id
    ]
  }

  security_rule {
    name                   = "in_allow_domain_controllers"
    priority               = "202"
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "*"
    source_port_range      = "*"
    destination_port_range = "*"
    source_application_security_group_ids = [
      azurerm_application_security_group.ad_ds.id
    ]
    destination_application_security_group_ids = [
      azurerm_application_security_group.ad_ds.id
    ]
  }

  security_rule {
    name                       = "in_deny_all"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.tags
}

resource "azurerm_virtual_network" "identity" {
  name                = "vnet-identity-${var.location}"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

  address_space = var.vnet_address_space
  dns_servers   = var.vnet_dns_servers // todo: enumerate list of ip addresses for domain controllers instead

  subnet {
    name           = "snet-ad-ds"
    address_prefix = var.ad_ds_subnet_address_prefix
    security_group = azurerm_network_security_group.ad_ds.id
  }

  tags = local.tags
}

data "azurerm_virtual_network" "hub_vnet" {
  provider            = azurerm.connectivity
  name                = var.hub_vnet.name
  resource_group_name = var.hub_vnet.resource_group_name
}

resource "azurerm_virtual_network_peering" "spoke_hub" {
  name                      = "identity-hub"
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.identity.name
  remote_virtual_network_id = data.azurerm_virtual_network.hub_vnet.id

  use_remote_gateways     = true
  allow_forwarded_traffic = true

  depends_on = [
    azurerm_virtual_network_peering.hub_spoke
  ]
}

resource "azurerm_virtual_network_peering" "hub_spoke" {
  provider                  = azurerm.connectivity
  name                      = "hub-identity"
  resource_group_name       = data.azurerm_virtual_network.hub_vnet.resource_group_name
  virtual_network_name      = data.azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.identity.id

  allow_gateway_transit = true
}