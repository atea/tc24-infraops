# Azure landing zones - Atealab / zemindar.onmicrosoft.com

Azure Landing Zones-deployment for Atealab / zemindar.onmicrosoft.com


## Auto-generated terraform-docs
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.4.0 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.39.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.56.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.39.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.56.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_landing_zones"></a> [azure\_landing\_zones](#module\_azure\_landing\_zones) | Azure/caf-enterprise-scale/azurerm | 4.0.1 |

## Resources

| Name | Type |
|------|------|
| [azuread_group.landingzones_contributor](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.landingzones_owner](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.platform_contributor](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.platform_owner](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.root_owner](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.root_reader](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.sandbox_contributor](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azuread_group.sandbox_owner](https://registry.terraform.io/providers/hashicorp/azuread/2.39.0/docs/resources/group) | resource |
| [azurerm_role_assignment.landingzones_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.landingzones_owner](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.platform_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.platform_owner](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.root_owner](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.root_reader](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sandbox_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.sandbox_owner](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/resources/role_assignment) | resource |
| [azurerm_client_config.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.56.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_decommissioned_subscription_ids"></a> [decommissioned\_subscription\_ids](#input\_decommissioned\_subscription\_ids) | Subscription IDs to be placed in Decommissioned management group | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_default_location"></a> [default\_location](#input\_default\_location) | Default location for ALZ resources | `string` | `"westeurope"` | no |
| <a name="input_deploy_management_resources"></a> [deploy\_management\_resources](#input\_deploy\_management\_resources) | Management | `bool` | `true` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | n/a | `number` | `50` | no |
| <a name="input_management_resources_location"></a> [management\_resources\_location](#input\_management\_resources\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_management_resources_tags"></a> [management\_resources\_tags](#input\_management\_resources\_tags) | n/a | `map(string)` | <pre>{<br>  "deployed_by_terraform": true<br>}</pre> | no |
| <a name="input_management_subscription_id"></a> [management\_subscription\_id](#input\_management\_subscription\_id) | ID for the management subscription | `string` | n/a | yes |
| <a name="input_root_id"></a> [root\_id](#input\_root\_id) | Used for naming ALZ resources | `string` | `"myorg"` | no |
| <a name="input_root_name"></a> [root\_name](#input\_root\_name) | Used for naming ALZ resources | `string` | `"My Organization"` | no |
| <a name="input_security_alerts_email_address"></a> [security\_alerts\_email\_address](#input\_security\_alerts\_email\_address) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->