provider "azurerm" {
  features {}
}

data "azurerm_client_config" "primary" {}

# provider "azurerm" {
#   alias           = "connectivity"
#   subscription_id = var.connectivity_subscription_id
#   features {}
# }

module "alz_architecture" {
  source            = "Azure/caf-enterprise-scale/azurerm"
  version           = "3.1.2"
  disable_telemetry = true

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
        archetype_id = "sm_landingzone"
        parameters = {
        }
        access_control = {
        }
      }
    }
  }
}

moved {
  from = module.spoke_network
  to   = module.test_spoke_network
}

moved {
  from = azurerm_resource_group.IaaC
  to   = azurerm_resource_group.test_IaaC
}

moved {
  from = azurerm_storage_account.terraformStateStorage
  to   = azurerm_storage_account.test_terraformStateStorage
}

# module "test_spoke_network" {
#   source = "git::https://github.com/fwikestad/terraform-spoke-network"

#   providers = {
#     azurerm              = azurerm
#     azurerm.connectivity = azurerm.connectivity
#   }

#   location                     = var.resource_location
#   landingzone_name             = var.landing_zone_name
#   environment                  = var.enviroment
#   hub_vnet_name                = var.hub_vnet_name
#   hub_vnet_resource_group_name = var.hub_resource_group
#   vnet_address_space           = var.vnet_address_space
#   subnets                      = var.vnet_subnets
# }

resource "azurerm_resource_group" "test_IaaC" {
  name     = "rg-IaaC-Management"
  location = "norwayeast"
}

resource "azurerm_storage_account" "test_terraformStateStorage" {
  name                     = "${lower(replace(var.landing_zone_name, "-", ""))}iaacstorage"
  location                 = var.resource_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  resource_group_name      = azurerm_resource_group.test_IaaC.name
}
