# Root
resource "azuread_group" "root_owner" {
  display_name     = "Azure-ALZ-Root-Owner"
  description      = "Grant Owner-role on ALZ root management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "root_owner" {
  scope                = module.alz_architecture.azurerm_management_group.level_1["/providers/Microsoft.Management/managementGroups/${var.root_id}"].id
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
  scope                = module.alz_architecture.azurerm_management_group.level_1["/providers/Microsoft.Management/managementGroups/${var.root_id}"].id
  role_definition_name = "Reader"
  principal_id         = azuread_group.root_reader.id
}

# Platform
resource "azuread_group" "platform_owner" {
  display_name     = "Azure-Platform-Owner"
  description      = "Grant Owner-role on Platform management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "platform_owner" {
  scope                = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-platform"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.platform_owner.id
}

resource "azuread_group" "platform_contributor" {
  display_name     = "Azure-Platform-Contributor"
  description      = "Grant Contributor-role on Platform management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "platform_contributor" {
  scope                = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-platform"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.platform_contributor.id
}

# Landing Zones
resource "azuread_group" "landingzones_owner" {
  display_name     = "Azure-LandingZones-Owner"
  description      = "Grant Owner-role on all landing zones"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "landingzones_owner" {
  scope                = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.landingzones_owner.id
}

resource "azuread_group" "landingzones_contributor" {
  display_name     = "Azure-LandingZones-Contributor"
  description      = "Grant Contributor-role on all landing zones"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "landingzones_contributor" {
  scope                = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.landingzones_contributor.id
}

# Sandboxes
resource "azuread_group" "sandbox_owner" {
  display_name     = "Azure-Sandbox-Owner"
  description      = "Grant Owner-role on all Sandbox management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "sandbox_owner" {
  scope                = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-sandboxes"].id
  role_definition_name = "Owner"
  principal_id         = azuread_group.sandbox_owner.id
}

resource "azuread_group" "sandbox_contributor" {
  display_name     = "Azure-Sandbox-Contributor"
  description      = "Grant Contributor-role on all Sandbox management group"
  mail_enabled     = false
  security_enabled = true
}

resource "azurerm_role_assignment" "sandbox_contributor" {
  scope                = module.alz_architecture.azurerm_management_group.level_2["/providers/Microsoft.Management/managementGroups/${var.root_id}-sandboxes"].id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.sandbox_contributor.id
}


##TC24
data "azuread_group" "TC24-Deltakere" {
  display_name     = "TC24-Deltakere"
  security_enabled = true
}

resource "azurerm_role_assignment" "Deltaker-LZ-Owner" {
  scope                = "/providers/Microsoft.Management/managementGroups/${var.root_id}-landing-zones"
  role_definition_name = "Owner"
  principal_id         = data.azuread_group.TC24-Deltakere.object_id
}

resource "azurerm_role_assignment" "Deltaker-New-Subs-Owner" {
  scope                = "/providers/Microsoft.Management/managementGroups/New-Subs"
  role_definition_name = "Owner"
  principal_id         = data.azuread_group.TC24-Deltakere.object_id
}

resource "azurerm_role_assignment" "Deltaker-Hub-Network-Contributor" {
  scope                = "/providers/Microsoft.Management/managementGroups/${var.root_id}-connectivity"
  role_definition_name = "Network Contributor"
  principal_id         = data.azuread_group.TC24-Deltakere.object_id
}

resource "azurerm_role_assignment" "Deltaker-portal-global-reader" {
  scope                = "/providers/Microsoft.Management/managementGroups/atealab"
  role_definition_name = "Reader"
  principal_id         = data.azuread_group.TC24-Deltakere.object_id
}