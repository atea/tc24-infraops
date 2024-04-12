terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
  }
}

/* data "azuread_users" "it_employees" {
    user_principal_names = [
        ""
    ]
    user_principal_names = var.it_employees_upns
}

resource "azuread_group_member" "platform_owners" {
    group_object_id = azuread_group.platform_owners.id
    for_each = data.azuread_users.it_employees
    member_object_id = each.value.id
} */

data "azuread_user" "it_admin" {
  user_principal_name = ""
}

locals {
  platform_group_owners = [
    data.azuread_user.it_admin.object_id
  ]
}

resource "azuread_group" "platform_owners" {
  display_name       = "PIM-ALZ-Platform-Owners"
  description        = "Grant Owner role on all ALZ Platform management groups and subscriptions"
  assignable_to_role = true
  owners             = local.platform_group_owners
  security_enabled   = true
}

resource "azuread_group" "platform_contributors" {
  display_name       = "PIM-ALZ-Platform-Contributors"
  description        = "Grant Contributor role on all ALZ Platform management groups and subscriptions"
  assignable_to_role = true
  owners             = local.platform_group_owners
  security_enabled   = true
}

resource "azuread_group" "platform_readers" {
  display_name       = "PIM-ALZ-Platform-Readers"
  description        = "Grant Owner role on all ALZ Platform management groups and subscriptions"
  assignable_to_role = true
  owners             = local.platform_group_owners
  security_enabled   = true
}