# Identity Zone configuration

## Auto-generated documentation
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >= 2.0.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.0.0 |
| <a name="provider_azurerm.connectivity"></a> [azurerm.connectivity](#provider\_azurerm.connectivity) | >= 3.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group) | resource |
| [azuread_group_member.admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/group_member) | resource |
| [azurerm_application_security_group.ad_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_security_group) | resource |
| [azurerm_availability_set.ad_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |
| [azurerm_key_vault.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.admins](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.service_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_secret.admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_managed_disk.data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.ad_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.ad_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.ad_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group.network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_machine_data_disk_attachment.data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_virtual_network.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.hub_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_windows_virtual_machine.ad_ds](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |
| [random_password.ad_ds](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azuread_service_principal.service_connection](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azuread_users.admins](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/users) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_virtual_network.hub_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_ds_subnet_address_prefix"></a> [ad\_ds\_subnet\_address\_prefix](#input\_ad\_ds\_subnet\_address\_prefix) | Address space for Active Directory Domain Services subnet | `string` | n/a | yes |
| <a name="input_ad_ds_vm_size"></a> [ad\_ds\_vm\_size](#input\_ad\_ds\_vm\_size) | VM size for Domain Controllers | `string` | `"Standard_B4ms"` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Username for local admin account | `string` | `"azadm"` | no |
| <a name="input_allowed_management_networks"></a> [allowed\_management\_networks](#input\_allowed\_management\_networks) | List of allowed management networks | `list(string)` | n/a | yes |
| <a name="input_domain_controllers"></a> [domain\_controllers](#input\_domain\_controllers) | Map of domain controllers | `map(any)` | n/a | yes |
| <a name="input_hub_vnet"></a> [hub\_vnet](#input\_hub\_vnet) | Hub virtual network for peering | <pre>object({<br>    resource_group_name = string<br>    name                = string<br>    id                  = string<br>  })</pre> | n/a | yes |
| <a name="input_keyvault_admins"></a> [keyvault\_admins](#input\_keyvault\_admins) | List of user principal names for key vault administrators | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | default location for resources in identity zone | `string` | `"westeurope"` | no |
| <a name="input_service_connection_name"></a> [service\_connection\_name](#input\_service\_connection\_name) | Name of app registration in Azure AD that is setup as service connection in Azure DevOps | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | Address space for identity zone virtual network | `list(string)` | n/a | yes |
| <a name="input_vnet_dns_servers"></a> [vnet\_dns\_servers](#input\_vnet\_dns\_servers) | DNS servers for identity zone virtual network | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | n/a |
<!-- END_TF_DOCS -->