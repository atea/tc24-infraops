resource "azurerm_resource_group" "ad_ds" {
  name     = "rg-ad-ds"
  location = var.location

  tags = local.tags
}

resource "random_password" "ad_ds" {
  length  = 32
  special = false
}

resource "azurerm_network_interface" "ad_ds" {
  for_each            = var.domain_controllers
  name                = "nic-${each.key}"
  location            = azurerm_resource_group.ad_ds.location
  resource_group_name = azurerm_resource_group.ad_ds.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_virtual_network.identity.subnet.*.id[0]
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.ip_address
  }

  tags = local.tags
}

resource "azurerm_availability_set" "ad_ds" {
  name                = "as-ad-ds-${azurerm_resource_group.ad_ds.location}"
  location            = azurerm_resource_group.ad_ds.location
  resource_group_name = azurerm_resource_group.ad_ds.name

  tags = local.tags
}

resource "azurerm_windows_virtual_machine" "ad_ds" {
  for_each            = var.domain_controllers
  name                = "vm-${each.key}"
  location            = azurerm_resource_group.ad_ds.location
  resource_group_name = azurerm_resource_group.ad_ds.name

  size           = var.ad_ds_vm_size
  admin_username = var.admin_username
  admin_password = random_password.ad_ds.result

  network_interface_ids = [
    azurerm_network_interface.ad_ds[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }

  tags = local.tags
}

resource "azurerm_managed_disk" "data" {
  for_each             = var.domain_controllers
  name                 = "disk-${each.key}-data01"
  location             = azurerm_resource_group.ad_ds.location
  resource_group_name  = azurerm_resource_group.ad_ds.name
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "4"

  tags = local.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data" {
  for_each           = var.domain_controllers
  managed_disk_id    = azurerm_managed_disk.data[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.ad_ds[each.key].id
  lun                = 0
  caching            = "None"
}

resource "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.domain_controllers
  name         = each.key
  value        = random_password.ad_ds.result
  key_vault_id = azurerm_key_vault.identity.id

  depends_on = [
    azurerm_key_vault_access_policy.admins,
    azurerm_key_vault_access_policy.service_connection
  ]
}