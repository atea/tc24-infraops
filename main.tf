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
}