# Site-Site VPN

Module to setup site-site VPN to Azure with an existing virtual network gateway

## Auto-generated documentation
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_local_network_gateway.on_premises](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.site_vpn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space of the on-premises networks | `list(string)` | n/a | yes |
| <a name="input_gateway_address"></a> [gateway\_address](#input\_gateway\_address) | The IP address of the on-premises VPN appliance | `string` | n/a | yes |
| <a name="input_ipsec_policy"></a> [ipsec\_policy](#input\_ipsec\_policy) | IPsec policy for Site-Site VPN | <pre>object({<br>    dh_group         = string<br>    ike_encryption   = string<br>    ike_integrity    = string<br>    ipsec_encryption = string<br>    ipsec_integrity  = string<br>    pfs_group        = string<br>  })</pre> | <pre>{<br>  "dh_group": "DHGroup2",<br>  "ike_encryption": "AES256",<br>  "ike_integrity": "SHA256",<br>  "ipsec_encryption": "AES256",<br>  "ipsec_integrity": "SHA256",<br>  "pfs_group": "None"<br>}</pre> | no |
| <a name="input_lgw_name"></a> [lgw\_name](#input\_lgw\_name) | Name of location for Local Network Gateway | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | The resource group for VPN resources | <pre>object({<br>    name     = string<br>    location = string<br>  })</pre> | n/a | yes |
| <a name="input_virtual_network_gateway"></a> [virtual\_network\_gateway](#input\_virtual\_network\_gateway) | Virtual Network Gateway in Azure | <pre>object({<br>    id   = string<br>    name = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->