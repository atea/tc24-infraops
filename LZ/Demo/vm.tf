resource "azurerm_resource_group" "vm" {
  name     = "rg-test"
  location = var.resource_location
}

module "vm" {
  source              = "github.com/fwikestad/terraform-azurerm-windows-vm"
  vm_name             = "test"
  resource_group_name = azurerm_resource_group.vm.name
  location            = var.resource_location
  subnet_id           = module.network.subnets["snet01"].id
  vm_password         = "ChangeMe123!"
  use_public_ip       = true
}

resource "azurerm_network_security_rule" "rdp" {
  name                        = "Allow RDP From my IP"
  resource_group_name         = module.network.resource_group_name
  network_security_group_name = module.network.nsg_name

  priority  = 100
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_address_prefix = "91.184.138.88/32"
  source_port_range     = "*"

  destination_address_prefix = "*"
  destination_port_range     = "3389"

}