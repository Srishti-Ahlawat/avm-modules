<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6, < 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.71.0, <= 3.87.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.71.0, <= 3.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_key_vault.kv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.pagerduty_integration_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_groups"></a> [action\_groups](#input\_action\_groups) | n/a | <pre>map(object({<br>    name                = string<br>    short_name          = string<br>    resource_group_name = string<br>    enabled             = bool<br><br>    webhook_receivers   = optional(list(object({<br>      name                    = string<br>      service_uri             = optional(string)<br>      use_common_alert_schema = optional(bool, true)<br>      key_vault_secret_id     = optional(string)<br>    })))<br><br>    email_receivers     = optional(list(object({<br>      name                    = string<br>      email_address           = string<br>      use_common_alert_schema = optional(bool, true)<br>    })))<br>  }))</pre> | `{}` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Name of the vault where you put the PagerDuty key | `string` | n/a | yes |
| <a name="input_key_vault_rg_name"></a> [key\_vault\_rg\_name](#input\_key\_vault\_rg\_name) | The resource group associated with the vault | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->