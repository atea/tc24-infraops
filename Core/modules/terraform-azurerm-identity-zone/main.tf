terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
      configuration_aliases = [
        azurerm.connectivity
      ]
    }
  }
}

data "azurerm_client_config" "current" {}

locals {
  mandatory_tags = {
    "costcenter"           = ""
    "created-by"           = data.azurerm_client_config.current.client_id
    "created-by-terraform" = true
  }

  tags = merge(local.mandatory_tags, var.tags)
}