
<!-- BEGIN_TF_DOCS -->
# Azure Palo Alto Virtual Network Appliance and Next Generation Firewall

This module deploys and manages Palo Alto resources in Azure, including the Virtual Network Appliance and the Next Generation Firewall with Panorama.

## Features

This module includes:
- Deployment of a Palo Alto Virtual Network Appliance (NVA).
- Deployment of a Palo Alto Next Generation Firewall configured with Panorama.
- Configuration of a Virtual Hub Routing Intent to direct traffic to the firewall.

## Example Usage

Here is an example of how to use this module in your Terraform configuration:

```terraform
module "palo_alto" {
    source = "../"
    firewall = var.firewall
    routing_intent = var.routing_intent
    nva = var.nva
}
```

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3.105)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 3.105)

- <a name="provider_random"></a> [random](#provider\_random) (~> 3.5)

## Resources

The following resources are used by this module:

- [azurerm_palo_alto_virtual_network_appliance](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/palo_alto_virtual_network_appliance)
- [azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/palo_alto_next_generation_firewall_virtual_hub_panorama)
- [azurerm_virtual_hub_routing_intent](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_routing_intent)

## Required Inputs

The following input variables are required:

### `nva`

Description: Configuration for Palo Alto Virtual Network Appliance.

Type:
```hcl
map(object({
  name    = string
  region  = string
  vhub_id = string
}))
```

### `firewall`

Description: Configuration for Palo Alto Next Generation Firewall with Panorama.

Type:
```hcl
map(object({
  name                = string
  region              = string
  vhub_id             = string
  resource_group_name = string
  public_ip_id        = string
  panorama_config     = string
}))
```

### `routing_intent`

Description: Configuration for Virtual Hub Routing Intent.

Type:
```hcl
map(object({
  name         = string
  vhub_id      = string
  policy_name  = string
  destinations = list(string)
  region       = string
}))
```

## Outputs

The following outputs are exported:

### `nva_ids`

Description: A map of Palo Alto Virtual Network Appliance resource IDs by region.

### `firewall_ids`

Description: A map of Palo Alto Next Generation Firewall resource IDs by region.

### `routing_intent_ids`

Description: A map of Virtual Hub Routing Intent resource IDs by region.

## Tags

The resources created by this module support optional tags. You can specify tags by including a `tags` variable in your configuration.

<!-- END_TF_DOCS -->
