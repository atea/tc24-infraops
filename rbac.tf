# Root
resource "azuread_group" "root_owner" {
  display_name     = "Azure-ALZ-Root-Owner"
  description      = "Grant Owner-role on ALZ root management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "root_owner" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_1["/providers/Microsoft.Management/managementGroups/${var.root_id}"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.root_owner.id
}

resource "azuread_group" "root_reader" {
  display_name     = "Azure-ALZ-Root-Reader"
  description      = "Grant Reader-role on ALZ root management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "root_reader" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_1["/providers/Microsoft.Management/managementGroups/${var.root_id}"].id
  role_definition_name = "Reader"
  principal_id         = azuread_group.root_owner.id
}

# Platform
resource "azuread_group" "platform_owner" {
  display_name     = "Azure-Platform-Owner"
  description      = "Grant Owner-role on Platform management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "platform_owner" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-platform"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.root_owner.id
}

resource "azuread_group" "platform_contributor" {
  display_name     = "Azure-Platform-Contributor"
  description      = "Grant Contributor-role on Platform management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "platform_contributor" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-platform"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.root_owner.id
}

# Landing Zones
resource "azuread_group" "landingzones_owner" {
  display_name     = "Azure-LandingZones-Owner"
  description      = "Grant Owner-role on all landing zones"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "landingzones_owner" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.root_owner.id
}

resource "azuread_group" "landingzones_contributor" {
  display_name     = "Azure-LandingZones-Contributor"
  description      = "Grant Contributor-role on all landing zones"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "landingzones_contributor" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.root_owner.id
}

# Sandboxes
resource "azuread_group" "sandbox_owner" {
  display_name     = "Azure-Sandbox-Owner"
  description      = "Grant Owner-role on all Sandbox management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "sandbox_owner" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-sandboxes"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.root_owner.id
}

resource "azuread_group" "sandbox_contributor" {
  display_name     = "Azure-Sandbox-Contributor"
  description      = "Grant Contributor-role on all Sandbox management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "sandbox_contributor" {
  scope                = module.azure_landing_zones.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-sandboxes"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.root_owner.id
}