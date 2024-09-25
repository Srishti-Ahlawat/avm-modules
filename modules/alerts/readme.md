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
| [azurerm_monitor_metric_alert.alerts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_metric_alerts"></a> [metric\_alerts](#input\_metric\_alerts) | n/a | <pre>map(object({<br>    name                     = string<br>    resource_group_name      = string<br>    scopes                   = list(string)<br>    description              = string<br>    enabled                  = optional(bool)<br>    auto_mitigate            = optional(bool)<br>    frequency                = optional(string)<br>    severity                 = optional(number)<br>    target_resource_type     = optional(string)<br>    target_resource_location = optional(string)<br>    window_size              = optional(string)<br>    actions_group_ids        = list(string)<br>     <br>    criteria = map(object({<br>      metric_namespace = string<br>      metric_name      = string<br>      aggregation      = string<br>      operator         = string<br>      threshold        = string<br><br>      dimension = optional(map(object({<br>        name     = string<br>        operator = string<br>        values   = list(string)<br>      })))<br>    }))<br>  }))</pre> | - | yes |

## Outputs

No outputs.

## Example Usage

``hcl
module "example_alert"
{
    source              = "path/to/module"

    # Required Inputs
    metric_alerts       = var.metric_alerts
}
```

## Example Tfvars

```hcl
metric_alerts = {
  alert1 = {
    name                     = "CPUHighAlert"
    resource_group_name      = "test-epac"
    scopes                   = ["/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourcegroups/test-epac/providers/Microsoft.Compute/virtualMachines/test-vm1313"]
    description              = "Alert when CPU usage is high"
    enabled                  = true
    auto_mitigate            = false
    frequency                = "PT5M"
    severity                 = 3
    target_resource_type     = "Microsoft.Compute/virtualMachines"
    target_resource_location = "eastus"
    window_size              = "PT15M"
    actions_group_ids        = ["/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/test-epac/providers/Microsoft.Insights/actiongroups/CriticalAlertsGroup"]

    criteria = {
      cpu_usage_criteria = {
        metric_namespace = "Microsoft.Compute/virtualMachines"
        metric_name      = "Percentage CPU"
        aggregation      = "Average"
        operator         = "GreaterThan"
        threshold        = 80
      }
    }
  }
}

```
<!-- END_TF_DOCS -->
