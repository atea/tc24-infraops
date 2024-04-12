# Core Azure Landing Zones-architecture

## Usage

1. Create a new branch
2. Make your adjustments
3. Create pull-request to main
4. Verify Terraform Plan output from Pipeline verification
5. Message Approver for approvment of change
6. When approved, Squash merge request and approve Terraform Apply phase of pipeline.

## Auto-generated Terraform Docs
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.31.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.78.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.78.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alz_architecture"></a> [alz\_architecture](#module\_alz\_architecture) | Azure/caf-enterprise-scale/azurerm | 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.78.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ad_ds_subnet_address_prefix"></a> [ad\_ds\_subnet\_address\_prefix](#input\_ad\_ds\_subnet\_address\_prefix) | Address space for Active Directory Domain Services | `string` | n/a | yes |
| <a name="input_allowed_management_networks"></a> [allowed\_management\_networks](#input\_allowed\_management\_networks) | List of allowed management networks | `list(string)` | n/a | yes |
| <a name="input_atlazo_network_address_space"></a> [atlazo\_network\_address\_space](#input\_atlazo\_network\_address\_space) | IP Addressroom for Atlazo site | `list(string)` | n/a | yes |
| <a name="input_atlazo_network_gateway_address"></a> [atlazo\_network\_gateway\_address](#input\_atlazo\_network\_gateway\_address) | The IP Address of the on-prem VPN Appliance | `string` | n/a | yes |
| <a name="input_connectivity_resources_location"></a> [connectivity\_resources\_location](#input\_connectivity\_resources\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_connectivity_resources_tags"></a> [connectivity\_resources\_tags](#input\_connectivity\_resources\_tags) | n/a | `map(string)` | <pre>{<br>  "costcenter": "130",<br>  "created-by-terraform": true<br>}</pre> | no |
| <a name="input_connectivity_subscription_id"></a> [connectivity\_subscription\_id](#input\_connectivity\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_decommissioned_subscription_ids"></a> [decommissioned\_subscription\_ids](#input\_decommissioned\_subscription\_ids) | List of subscription IDs that are decommissioned | `list(string)` | n/a | yes |
| <a name="input_deploy_connectivity_resources"></a> [deploy\_connectivity\_resources](#input\_deploy\_connectivity\_resources) | n/a | `bool` | `false` | no |
| <a name="input_deploy_identity_resources"></a> [deploy\_identity\_resources](#input\_deploy\_identity\_resources) | n/a | `bool` | `false` | no |
| <a name="input_deploy_management_resources"></a> [deploy\_management\_resources](#input\_deploy\_management\_resources) | n/a | `bool` | `false` | no |
| <a name="input_identity_subscription_id"></a> [identity\_subscription\_id](#input\_identity\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_identity_vnet_address_space"></a> [identity\_vnet\_address\_space](#input\_identity\_vnet\_address\_space) | Address space for identity zone virtual network | `list(string)` | n/a | yes |
| <a name="input_keyvault_admins"></a> [keyvault\_admins](#input\_keyvault\_admins) | List of user principal names that will get admin access to identity zone key vault | `list(string)` | n/a | yes |
| <a name="input_local_network_address_space"></a> [local\_network\_address\_space](#input\_local\_network\_address\_space) | List of address spaces of the on-premises networks | `list(string)` | n/a | yes |
| <a name="input_local_network_gateway_address"></a> [local\_network\_gateway\_address](#input\_local\_network\_gateway\_address) | The IP address of the on-premises VPN appliance | `string` | n/a | yes |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | n/a | `number` | `50` | no |
| <a name="input_management_resources_location"></a> [management\_resources\_location](#input\_management\_resources\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_management_resources_tags"></a> [management\_resources\_tags](#input\_management\_resources\_tags) | n/a | `map(string)` | <pre>{<br>  "costcenter": "130",<br>  "created-by-terraform": true<br>}</pre> | no |
| <a name="input_management_subscription_id"></a> [management\_subscription\_id](#input\_management\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_root_id"></a> [root\_id](#input\_root\_id) | n/a | `string` | `"myorg"` | no |
| <a name="input_root_name"></a> [root\_name](#input\_root\_name) | n/a | `string` | `"My Organization"` | no |
| <a name="input_security_alerts_email_address"></a> [security\_alerts\_email\_address](#input\_security\_alerts\_email\_address) | n/a | `string` | n/a | yes |
| <a name="input_service_connection_name"></a> [service\_connection\_name](#input\_service\_connection\_name) | Name of app registration in Azure AD that is setup as service connection in Azure DevOps | `string` | n/a | yes |
| <a name="input_southeast_asia_network_address_space"></a> [southeast\_asia\_network\_address\_space](#input\_southeast\_asia\_network\_address\_space) | List of address spaces of the on-premises networks | `list(string)` | n/a | yes |
| <a name="input_southeast_asia_network_gateway_address"></a> [southeast\_asia\_network\_gateway\_address](#input\_southeast\_asia\_network\_gateway\_address) | The IP address of the on-premises VPN appliance | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->