output "subnets" {
  value       = data.azurerm_subnet.subnets
  description = "Spoke subnets"
}

output "resource_group_name" {
  value = azurerm_resource_group.network.name
}

output "nsg_name" {
  value = azurerm_network_security_group.spoke.name
}