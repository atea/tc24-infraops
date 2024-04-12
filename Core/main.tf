terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.31.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.78.0"
      configuration_aliases = [
        azurerm.connectivity,
        azurerm.identity,
        azurerm.management
      ]
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
  backend "azurerm" {}
}

provider "azuread" {}

provider "azurerm" {
  features {}
}

provider "random" {
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.connectivity_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "identity"
  subscription_id = var.identity_subscription_id
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = var.management_subscription_id
  features {}
}

data "azurerm_client_config" "core" {}

module "alz_architecture" {
  source            = "Azure/caf-enterprise-scale/azurerm"
  version           = "4.2.0"
  disable_telemetry = true
  library_path      = "${path.root}/lib"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm.management
  }

  default_location = var.connectivity_resources_location


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


  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  # Assign platform subscriptions
  subscription_id_connectivity = var.connectivity_subscription_id
  subscription_id_identity     = var.identity_subscription_id
  subscription_id_management   = var.management_subscription_id

  deploy_connectivity_resources    = var.deploy_connectivity_resources
  configure_connectivity_resources = local.configure_connectivity_resources

  deploy_identity_resources    = var.deploy_identity_resources
  configure_identity_resources = local.configure_identity_resources

  deploy_management_resources    = var.deploy_management_resources
  configure_management_resources = local.configure_management_resources
}