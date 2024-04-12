# Spoke network for Azure landing zone

Create a spoke virtual network in Azure and connect it to the hub virtual network

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |
| <a name="provider_azurerm.connectivity"></a> [azurerm.connectivity](#provider\_azurerm.connectivity) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.hub_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_client_config.core](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_virtual_network.hub_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Name of environment. Typically dev, test, prod | `string` | n/a | yes |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input\_hub\_vnet\_name) | Name of Hub VNET used for VNET peering | `string` | n/a | yes |
| <a name="input_hub_vnet_resource_group_name"></a> [hub\_vnet\_resource\_group\_name](#input\_hub\_vnet\_resource\_group\_name) | Name of resource group where hub vnet is located | `string` | n/a | yes |
| <a name="input_landingzone_name"></a> [landingzone\_name](#input\_landingzone\_name) | Name of Landing Zone. Typically a project name, or department | `string` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Address space for Spoke virtual network | `list(string)` | n/a | yes |
| <a name="input_vnet_dns_servers"></a> [vnet\_dns\_servers](#input\_vnet\_dns\_servers) | DNS servers for Spoke virtual network | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->