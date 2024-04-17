provider "azurerm" {
  features {}
}


#Test trigger
data "azurerm_client_config" "primary" {}

module "alz_architecture" {
  source            = "Azure/caf-enterprise-scale/azurerm"
  version           = "4.2.0"
  disable_telemetry = true

  default_location = var.resource_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id            = "${var.root_id}-landing-zones"
  root_id                   = var.root_id
  root_name                 = var.root_name
  deploy_core_landing_zones = false
  library_path              = "${path.root}/lib"

  custom_landing_zones = {
    "${lower(var.root_id)}-${var.landing_zone_name}" = {
      display_name               = var.landing_zone_name
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = var.landing_zone_subscription_ids
      archetype_config = {
        archetype_id = "demo_landingzone"
        parameters = {
        }
        access_control = {
        }
      }
    }
  }
}

module "network" {
  source = "git::https://github.com/fwikestad/terraform-spoke-network"

  hub_vnet_name = "atealab-hub-norwayeast"
  hub_vnet_resource_group_name = "atealab-hub-norwayeast"
  
  environment = "prod"
  landingzone_name = "Demo"

  vnet_address_space = [ "10.1.0.0/16" ]
  subnets = {
    snet01 = {
      address_prefix = "10.1.0.0/24"
    }
  }
}