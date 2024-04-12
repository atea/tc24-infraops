
/* data "azurerm_virtual_network" "hub" {
  provider            = azurerm.connectivity
  name                = ""
  resource_group_name = ""

  depends_on = [
    module.alz_architecture
  ]
}

resource "random_password" "trondheim_site_vpn" {
  special = true
  numeric = true
  length  = 128
}

module "trondheim_site_vpn" {
  source = "./modules/terraform-azurerm-site-vpn"
  providers = {
    azurerm = azurerm.connectivity
  }

  resource_group          = module.alz_architecture.azurerm_resource_group.connectivity[]
  lgw_name                = ""
  gateway_address         = var.local_network_gateway_address
  address_space           = var.local_network_address_space
  virtual_network_gateway = module.alz_architecture.azurerm_virtual_network_gateway.connectivity[]
  vpn_secret              = random_password.trondheim_site_vpn.result
} */
/*
resource "azurerm_key_vault_secret" "trd-s2s-key" {
  name         = "1-key"
  value        = random_password.trondheim_site_vpn.result
  key_vault_id = module.identity_zone.keyvault_id
} */