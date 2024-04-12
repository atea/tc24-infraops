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

provider "azurerm" {
  features {}
}

/*
    Replace the susbcription_id with the subscription id for the connectivity subscription where the hub network is located
*/
provider "azurerm" {
  alias           = "connectivity"
  subscription_id = "uuid-for-connectivity-subscription"
  features {}
}

data "azurerm_client_config" "core" {}

module "spoke_network" {
  source = "../../"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
  }

  costcenter                   = "130"
  environment                  = "dev"
  landingzone_name             = "IT"
  hub_vnet_name                = "nsc-hub-westeurope"
  hub_vnet_resource_group_name = "nsc-connectivity-westeurope"
  vnet_address_space           = ["10.11.12.0/24"]
  vnet_dns_servers = [
    "10.32.4.4",
    "10.32.4.5"
  ]
  subnets = {
    "snet-01" = {
      address_prefix = "10.11.12.0/26"
    }
    "snet-02" = {
      address_prefix = "10.11.12.64/26"
    }
  }
}