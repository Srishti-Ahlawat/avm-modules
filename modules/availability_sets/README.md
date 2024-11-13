
# Azure Availability Set Terraform Module

This Terraform module manages the deployment of an Azure Availability Set. It provides configurable options for fault and update domains, as well as optional integration with a Proximity Placement Group and resource tagging.

## Module Features

- Creates an Azure Availability Set with optional managed disks.
- Supports fault and update domain configuration.
- Optionally integrates with a Proximity Placement Group for low-latency needs.
- Allows for custom tags to be added to the Availability Set.

## Usage

Include this module in your Terraform configuration, specifying the required parameters and any optional ones as needed.

### Example

```hcl
module "availability_set" {
  source                      = "./availability_set_module"
  name                        = "example-availability-set"
  location                    = "East US"
  resource_group_name         = "example-resource-group"
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
  managed                     = true
  proximity_placement_group_id = "example-proximity-placement-group-id"  # Optional
  tags                        = {
    environment = "production"
    project     = "example-project"
  }
}
```

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.105)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Inputs

| Name                          | Description                                                                                         | Type         | Default | Required |
|-------------------------------|-----------------------------------------------------------------------------------------------------|--------------|---------|----------|
| `name`                        | Specifies the name of the Availability Set.                                                         | `string`     | n/a     | yes      |
| `location`                    | The Azure region where the Availability Set will be created.                                       | `string`     | n/a     | yes      |
| `resource_group_name`         | The name of the resource group in which to create the Availability Set.                             | `string`     | n/a     | yes      |
| `platform_fault_domain_count` | The number of fault domains for the Availability Set (1-3, depending on region).                    | `number`     | `2`     | no       |
| `platform_update_domain_count`| The number of update domains for the Availability Set, with a default of 5.                         | `number`     | `5`     | no       |
| `managed`                     | Specifies whether the Availability Set uses managed disks.                                         | `bool`       | `true`  | no       |
| `proximity_placement_group_id`| The ID of an optional Proximity Placement Group to associate with the Availability Set.             | `string`     | `""`    | no       |
| `tags`                        | A map of tags to assign to the Availability Set.                                                    | `map(string)`| `{}`    | no       |

## Outputs

| Name                    | Description                                         |
|-------------------------|-----------------------------------------------------|
| `name`   |     The name of the Availability Set.          |
| `location` |      The location of the Availability Set.              |
| `resource_group_name` | The resource group name of the Availability Set. |

### `availability_set_details` Output

This output provides a consolidated map of all the Availability Set's key attributes, making it easy to access complete configuration details from a single output. The structure of `availability_set_details` is as follows:

- **`id`**: The unique ID of the Availability Set.
- **`name`**: The name of the Availability Set.
- **`location`**: The location of the Availability Set.
- **`resource_group_name`**: The resource group in which the Availability Set resides.
- **`platform_fault_domain_count`**: The fault domain count configured for the Availability Set.
- **`platform_update_domain_count`**: The update domain count for the Availability Set.
- **`managed`**: Specifies if the Availability Set uses managed disks.
- **`proximity_placement_group_id`**: The ID of the associated Proximity Placement Group, if any.
- **`tags`**: The tags applied to the Availability Set.

### Example of Output Access

In your root module, you can reference outputs as shown below:

```hcl
output "example_availability_set_id" {
  value = module.availability_set.availability_set_id
}

output "example_availability_set_name" {
  value = module.availability_set.availability_set_name
}

output "example_availability_set_details" {
  value = module.availability_set.availability_set_details
}
```

## Additional Notes

- **Fault Domains and Update Domains**: Fault domains offer redundancy, while update domains ensure availability during maintenance. Ensure these values are supported in your target region.
- **Proximity Placement Group**: This optional parameter optimizes latency by grouping resources in the same physical data center. This feature is useful for latency-sensitive workloads.

## License

This module is licensed under the MIT License.
