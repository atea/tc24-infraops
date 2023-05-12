terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.39.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.56.0"
    }
  }
  required_version = ">=1.4.0"
  backend "azurerm" {}
}

provider "azurerm" {
  features {

  }
}

data "azurerm_client_config" "core" {}

module "azure_landing_zones" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "4.0.1"

  default_location = var.default_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  library_path = "${path.root}/lib"

  deploy_management_resources    = var.deploy_management_resources
  subscription_id_management     = var.management_subscription_id
  configure_management_resources = local.configure_management_resources

  archetype_config_overrides = {
    landing-zones = {
      archetype_id = "es_landing_zones"
      parameters = {
        Deny-Subnet-Without-Nsg = {
          effect = "Audit"
        }
        Deploy-VM-Backup = {
          effect = "AuditIfNotExists"
        }
      }
      access_control = {}
    }
  }
  subscription_id_overrides = {
    decommissioned = var.decommissioned_subscription_ids
  }
}