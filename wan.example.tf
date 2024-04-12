//Southeast Asia to West Europe V2V tunnel
/* resource "random_password" "1_key" {
  length = 128
}

module "1_connection" {
  source = "./modules/terraform-azurerm-v2v-vpn"
  providers = {
    azurerm = azurerm.connectivity
  }

  virtual_network_gateway      = module.alz_architecture.azurerm_virtual_network_gateway.connectivity[""]
  peer_virtual_network_gateway = module.alz_architecture.azurerm_virtual_network_gateway.connectivity[""]

  vpn_secret = random_password.1_key.result

}

//West US 2 to West Europe V2V tunnell
resource "random_password" "2_connection" {
  length = 126
}

module "2_connection" {
  source = "./modules/terraform-azurerm-v2v-vpn"
  providers = {
    azurerm = azurerm.connectivity
  }

  virtual_network_gateway      = module.alz_architecture.azurerm_virtual_network_gateway.connectivity[""]
  peer_virtual_network_gateway = module.alz_architecture.azurerm_virtual_network_gateway.connectivity[""]

  vpn_secret = random_password.2_connection.result
} */