# Template for Landing zone deployments

This repository serves as a template-repository that can be forked to create new landing zones. The fork is necessary as Azure Devops does not have the same "template repository" concept found in GitHub

## Required permissions

1. [Create management group under landing zones](https://learn.microsoft.com/en-us/azure/governance/management-groups/manage#moving-management-groups-and-subscriptions)
2. Group Administrator-role in Azure AD

## Usage
<!-- Describe how to use the template repository to deploy new landing zones -->
1. Create a new fork of this repository in Azure Devops
2. Create a new container in the storage account used for remote backend
3. Add a new variable group in Azure Devops and set variables
    - Navigate to "Pipelines" -> "Library" -> "Variable groups" -> "+ Variable Group"
    - Add the `backend_container_name` variable with the container from step 2
    - Add all required variables:
        - `azuread_group_owner`
        - `landing_zone_name`
        - `landing_zone_subscription_ids`
    - Add the name of the variable group to `azure-pipelines.yml`. The order of group matters, and if the same variable name is used in multiple groups, the last instance will be used.
4. If your landing zone deployment adds additional required variables. Update `azure-pipelines.yml` to include them as environment variables in the `terraform plan` and `terraform apply` steps
5. If your deployment use Terraform modules stored in Azure Devops and not Terraform Registry, follow the instructions in `azure-pipelines.yml` to add these additional repositories as resources. Please note that you should use "https" to call your module, and not "ssh". If you prefer to use ssh, you will also need to amend the pipeline to use ssh keys for authentication

6. Setup the CI/CD pipeline in Azure Devops by navigating to "Pipelines" -> "New pipeline". Use "Azure Repos Git" and select your repository. Use "Run" or "Save" (hidden below the Run button) to save the new pipeline.
7. On the first run of the pipeline, you will need to grant the pipeline access to the variable groups. Optionally for troubleshooting you can also elect to just run the "plan" job to verify that your pipeline is setup correctly


## Virtual Network Peering
<!-- Extend landing zone deployment with vnet peering -->

# Auto-generated documentation
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >=2.31.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.34.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.55.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alz_architecture"></a> [alz\_architecture](#module\_alz\_architecture) | Azure/caf-enterprise-scale/azurerm | 3.1.2 |
| <a name="module_spoke_network"></a> [spoke\_network](#module\_spoke\_network) | ./modules/terraform-azurerm-lz-spoke-network/ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.core](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azuread_group_owner"></a> [azuread\_group\_owner](#input\_azuread\_group\_owner) | UserPrincipalName / Email address for user in Azure AD that will be set as Owner for access groups | `string` | n/a | yes |
| <a name="input_connectivity_subscription_id"></a> [connectivity\_subscription\_id](#input\_connectivity\_subscription\_id) | n/a | `string` | n/a | yes |
| <a name="input_enviroment"></a> [enviroment](#input\_enviroment) | n/a | `string` | `"prod"` | no |
| <a name="input_hub_network_ids"></a> [hub\_network\_ids](#input\_hub\_network\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_hub_resource_group"></a> [hub\_resource\_group](#input\_hub\_resource\_group) | n/a | `string` | n/a | yes |
| <a name="input_hub_vnet_name"></a> [hub\_vnet\_name](#input\_hub\_vnet\_name) | n/a | `string` | n/a | yes |
| <a name="input_landing_zone_name"></a> [landing\_zone\_name](#input\_landing\_zone\_name) | Name of the Landing Zone | `string` | n/a | yes |
| <a name="input_landing_zone_subscription_ids"></a> [landing\_zone\_subscription\_ids](#input\_landing\_zone\_subscription\_ids) | List of subscription IDs for the IT Landing Zone(s) | `list(string)` | n/a | yes |
| <a name="input_resource_location"></a> [resource\_location](#input\_resource\_location) | n/a | `string` | `"norwayeast"` | no |
| <a name="input_root_id"></a> [root\_id](#input\_root\_id) | Used by Azure Landing Zones-module for naming management groups and resources | `string` | `"nsc"` | no |
| <a name="input_root_name"></a> [root\_name](#input\_root\_name) | Used by Azure Landing Zones-module for naming management groups and resources | `string` | `"Nordic Semiconductor"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | n/a | `list(string)` | n/a | yes |
| <a name="input_vnet_subnets"></a> [vnet\_subnets](#input\_vnet\_subnets) | n/a | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->