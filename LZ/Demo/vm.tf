resource "azurerm_resource_group" "vm" {
  name     = "rg-test"
  location = var.resource_location
}

module "vm" {
  source              = "git::https://github.com/fwikestad/terraform-azurerm-windows-vm"
  vm_name             = "test"
  resource_group_name = azurerm_resource_group.vm.name
  location            = var.resource_location
  subnet_id           = module.network.subnets[snet_01].id
  vm_password         = "ChangeMe123!"
}