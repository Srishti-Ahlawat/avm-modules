
# Azure Policy Remediation Module

This Terraform module simplifies the creation and management of Azure Policy Remediations for resources based on assigned policies.

## Features

- Supports multiple policy assignments using `for_each`.
- Dynamically retrieves policy assignment IDs and resource IDs using data blocks.
- Flexible configuration for optional parameters like `policy_definition_reference_id`, `resource_discovery_mode`, and `location_filters`.
- Outputs the list of remediated resource IDs for validation and reuse.

## Prerequisites

- An existing policy assignment in your Azure subscription.
- Terraform v1.0.0 or later.
- AzureRM provider v3.0 or later.

## Usage

### Example Configuration

```hcl
module "policy_remediation" {
  source = "../"

  policy_assignments = var.policy_assignments
```

### Outputs

```hcl
output "resource_policy_remediation_ids" {
  description = "The IDs of the resource policy remediations."
  value = {
    for k, v in azurerm_resource_policy_remediation.this : k => v.id
  }
}

```


## Inputs

| Name                      | Type     | Description                                                                                     | Default |
|---------------------------|----------|-------------------------------------------------------------------------------------------------|---------|
| `policy_assignments`      | `map`    | Map of policy assignment configurations, including `name`, `policy_assignment_name`, and `resource_id`. | `{}`    |

## Outputs

| Name                  | Description                                    |
|-----------------------|------------------------------------------------|
| `remediation_resource_ids` | Map of resource IDs targeted by the remediations. |

## Contributing

Contributions are welcome! Please ensure your code passes linting and includes relevant tests.

## License

This project is licensed under the MIT License.

## Support

For issues, please open a GitHub issue or reach out to the maintainers.
