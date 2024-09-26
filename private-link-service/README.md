<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) |>= 1.6, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.6, <= 3.114.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.6, <= 3.114.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_link_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group where the Private Link Service should exist. | `string` | n/a | yes |
| <a name="input_private_link_services_tags"></a> [private\_link\_services\_tags](#input\_private\_link\_services\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_private_link_services"></a> [private\_link\_services](#input\_private\_link\_services) | Map containing private link services. | <pre>map(object({<br>    name                           = string<br>    location                       = string<br>    frontend_ip_config_name        = string<br>    pls_resource_group             = string<br>    subnet_name                    = string<br>    vnet_name                      = string<br>    networking_resource_group      = string<br>    loadbalancer_name              = string<br>    lb_resource_group              = string<br>    auto_approval_subscription_ids = optional(list(string))<br>    visibility_subscription_ids    = optional(list(string))<br>    enable_proxy_protocol          = optional(bool)<br>    private_ip_address             = optional(string)<br>    private_ip_address_version     = optional(string)<br>    fqdns                          = optional(list(string))<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pls_ids"></a> [pls\_ids](#output\_pls\_ids) | Private Link Service Ids. |
| <a name="output_pls_dns_names"></a> [pls\_dns\_names](#output\_pls\_dns\_names) | A globally unique DNS Name for your Private Link Service. You can use this alias to request a connection to your Private Link Service. |
| <a name="output_private_link_service_map_ids"></a> [private\_link\_service\_map\_ids](#output\_private\_link\_service\_map\_ids) | A mapping of Private Link Service names to their respective IDs. |
| <a name="output_azurerm_private_link_service_this"></a> [azurerm\_private\_link\_service\_this](#output\_azurerm\_private\_link\_service\_this) | The full resource block for the Azure Private Link Services created. |

## Example Usage

``hcl
module "private_link_services_example" {
  source = "../"
  resource_group_name = var.resource_group_name
  private_link_services = var.private_link_services
  private_link_services_tags = var.private_link_services_tags
}
```

## Example Tfvars

```hcl
resource_group_name = "new-epac" # "<resource_group_name>"

private_link_services = {
  pls1 = {
    name                           = "privatelinkservice"   # "<private_link_service_name>"
    frontend_ip_config_name        = "LoadBalancerFrontEnd" # "<lb_frontend_name>"
    subnet_id                      = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet-name" # "<subnet_id>"
    private_ip_address             = null                    # "<private_ip_address>"
    private_ip_address_version     = "IPv4"                  # "<private_ip_address_version>"
    visibility_subscription_ids    = null                    # <["00000000-0000-0000-0000-000000000000"]>
    load_balancer_frontend_ip_configuration_ids = ["/subscriptions/subs/resourceGroups/your-rg/providers/Microsoft.Network/loadBalancers/your-lb/frontendIPConfigurations/LoadBalancerFrontEnd"] # <["00000000-0000-0000-0000-000000000000"]>
    auto_approval_subscription_ids = null
    enable_proxy_protocol          = false                   # <-- Add this attribute if needed
    lb_resource_group              = "your-rg"               # <-- Add this attribute if needed
    loadbalancer_name              = "your-lb"              # <-- Add this attribute if needed
    location                       = "your-loc"                # <-- Add this attribute if needed
    networking_resource_group      = "your-rg"          # <-- Add this attribute if needed
    pls_resource_group             = "your-rg"                 # <-- Add this attribute if needed
    subnet_name                    = "your-subnet"                # <-- Add this attribute if needed
    vnet_name                      = "your-vnet"       # <-- Add this attribute if needed
  }
}

private_link_services_tags = {
  iac = "Terraform"
  env = "UAT"
}



```
<!-- END_TF_DOCS -->