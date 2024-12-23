# Variable declaration for the backend address pool name
variable "backend_address_pools" {
  type = map(object({
    name         = string
    fqdns        = optional(set(string))
    ip_addresses = optional(set(string))
  }))
  description = <<-DESCRIPTION
 - `name` - (Required) The name of the Backend Address Pool.
 - `fqdns` - (Optional) A list of FQDN's which should be part of the Backend Address Pool.
 - `ip_addresses` - (Optional) A list of IP Addresses which should be part of the Backend Address Pool.
DESCRIPTION
  nullable    = false
}

variable "backend_http_settings" {
  type = map(object({
    cookie_based_affinity               = optional(string, "Disabled")
    name                                = string
    port                                = number
    protocol                            = string
    affinity_cookie_name                = optional(string)
    host_name                           = optional(string)
    path                                = optional(string)
    pick_host_name_from_backend_address = optional(bool)
    probe_name                          = optional(string)
    request_timeout                     = optional(number)
    trusted_root_certificate_names      = optional(list(string))
    authentication_certificate = optional(list(object({
      name = string
    })))
    connection_draining = optional(object({
      drain_timeout_sec          = number
      enable_connection_draining = bool
    }))
  }))
  description = <<-DESCRIPTION
 - `cookie_based_affinity` - (Required) Is Cookie-Based Affinity enabled? Possible values are `Enabled` and `Disabled`.
 - `name` - (Required) The name of the Backend HTTP Settings Collection.
 - `port` - (Required) The port which should be used for this Backend HTTP Settings Collection.
 - `protocol` - (Required) The Protocol which should be used. Possible values are `Http` and `Https`.
 - `affinity_cookie_name` - (Optional) The name of the affinity cookie.
 - `host_name` - (Optional) Host header to be sent to the backend servers. Cannot be set if `pick_host_name_from_backend_address` is set to `true`.
 - `path` - (Optional) The Path which should be used as a prefix for all HTTP requests.
 - `pick_host_name_from_backend_address` - (Optional) Whether host header should be picked from the host name of the backend server. Defaults to `false`.
 - `probe_name` - (Optional) The name of an associated HTTP Probe.
 - `request_timeout` - (Optional) The request timeout in seconds, which must be between 1 and 86400 seconds. Defaults to `30`.
 - `trusted_root_certificate_names` - (Optional) A list of `trusted_root_certificate` names.

 ---
 `authentication_certificate` block supports the following:
 - `name` - (Required) The Name of the Authentication Certificate to use.

 ---
 `connection_draining` block supports the following:
 - `drain_timeout_sec` - (Required) The number of seconds connection draining is active. Acceptable values are from `1` second to `3600` seconds.
 - `enable_connection_draining` - (Required) If connection draining is enabled or not.
DESCRIPTION
  nullable    = false

  validation {
    # create a condition that checks host_name is null if pick_host_name_from_backend_address is set to true
    condition     = alltrue([for _, v in var.backend_http_settings : v.pick_host_name_from_backend_address == true ? v.host_name == null : true])
    error_message = "host_name must not be set if pick_host_name_from_backend_address is set to true."
  }
}

# Variable declaration for the frontend ports
variable "frontend_ports" {
  type = map(object({
    name = string
    port = number
  }))
  description = <<-DESCRIPTION
 - `name` - (Required) The name of the Frontend Port.
 - `port` - (Required) The port used for this Frontend Port.
DESCRIPTION
  nullable    = false
}

variable "gateway_ip_configuration" {
  type = object({
    name      = optional(string)
    subnet_id = string
  })
  description = <<-DESCRIPTION
 - `name` - (Required) The Name of this Gateway IP Configuration.
 - `subnet_id` - (Required) The ID of the Subnet which the Application Gateway should be connected to.
DESCRIPTION
  nullable    = false
}

variable "http_listeners" {
  type = map(object({
    name                           = string
    frontend_port_name             = string
    frontend_ip_configuration_name = optional(string)
    firewall_policy_id             = optional(string)
    require_sni                    = optional(bool)
    host_name                      = optional(string)
    host_names                     = optional(list(string))
    ssl_certificate_name           = optional(string)
    ssl_profile_name               = optional(string)
    custom_error_configuration = optional(list(object({
      status_code           = string
      custom_error_page_url = string
    })))
    # Define other attributes as needed
  }))
  description = <<-DESCRIPTION
 - `firewall_policy_id` - (Optional) The ID of the Web Application Firewall Policy which should be used for this HTTP Listener.
 - `frontend_ip_configuration_name` - (Required) The Name of the Frontend IP Configuration used for this HTTP Listener.
 - `frontend_port_name` - (Required) The Name of the Frontend Port use for this HTTP Listener.
 - `host_name` - (Optional) The Hostname which should be used for this HTTP Listener. Setting this value changes Listener Type to 'Multi site'.
 - `host_names` - (Optional) A list of Hostname(s) should be used for this HTTP Listener. It allows special wildcard characters.
 - `name` - (Required) The Name of the HTTP Listener.
 - `require_sni` - (Optional) Should Server Name Indication be Required? Defaults to `false`.
 - `ssl_certificate_name` - (Optional) The name of the associated SSL Certificate which should be used for this HTTP Listener.
 - `ssl_profile_name` - (Optional) The name of the associated SSL Profile which should be used for this HTTP Listener.

 ---
 `custom_error_configuration` block supports the following:
 - `custom_error_page_url` - (Required) Error page URL of the application gateway customer error.
 - `status_code` - (Required) Status code of the application gateway customer error. Possible values are `HttpStatus403` and `HttpStatus502`
DESCRIPTION
  nullable    = false
}

# Variable declaration for the  resource location
variable "location" {
  type        = string
  description = "The Azure regional location where the resources will be deployed."
  nullable    = false

  validation {
    condition     = length(var.location) > 0
    error_message = "The azure region must not be empty."
  }
}

# Variable declaration for the  application gateway name
variable "name" {
  type        = string
  description = "The name of the application gateway."

  validation {
    condition     = can(regex("^[a-z0-9-]{3,24}$", var.name))
    error_message = "The name must be between 3 and 24 characters long and can only contain lowercase letters, numbers and dashes."
  }
}

variable "request_routing_rules" {
  type = map(object({
    name                        = string
    rule_type                   = string
    http_listener_name          = string
    backend_address_pool_name   = optional(string)
    priority                    = optional(number)
    url_path_map_name           = optional(string)
    backend_http_settings_name  = optional(string)
    redirect_configuration_name = optional(string)
    rewrite_rule_set_name       = optional(string)
    # Define other attributes as needed
  }))
  description = <<-DESCRIPTION
 - `backend_address_pool_name` - (Optional) The Name of the Backend Address Pool which should be used for this Routing Rule. Cannot be set if `redirect_configuration_name` is set.
 - `backend_http_settings_name` - (Optional) The Name of the Backend HTTP Settings Collection which should be used for this Routing Rule. Cannot be set if `redirect_configuration_name` is set.
 - `http_listener_name` - (Required) The Name of the HTTP Listener which should be used for this Routing Rule.
 - `name` - (Required) The Name of this Request Routing Rule.
 - `priority` - (Optional) Rule evaluation order can be dictated by specifying an integer value from `1` to `20000` with `1` being the highest priority and `20000` being the lowest priority.
 - `redirect_configuration_name` - (Optional) The Name of the Redirect Configuration which should be used for this Routing Rule. Cannot be set if either `backend_address_pool_name` or `backend_http_settings_name` is set.
 - `rewrite_rule_set_name` - (Optional) The Name of the Rewrite Rule Set which should be used for this Routing Rule. Only valid for v2 SKUs.
 - `rule_type` - (Required) The Type of Routing that should be used for this Rule. Possible values are `Basic` and `PathBasedRouting`.
 - `url_path_map_name` - (Optional) The Name of the URL Path Map which should be associated with this Routing Rule.
DESCRIPTION
  nullable    = false
}

# This is required for most resource modules
variable "resource_group_name" {
  type        = string
  description = "The resource group where the resources will be deployed."

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name must not be empty."
  }
}

variable "create_public_ip" {
  type        = bool
  default     = true
  description = "Optional public IP to auto create public id"
}



# Variable declaration for the application gateway sku and tier
variable "sku" {
  type = object({
    name     = string              # Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2
    tier     = string              # Standard, Standard_v2, WAF and WAF_v2
    capacity = optional(number, 2) # V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU
  })
  default = {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }
  description = <<-DESCRIPTION
 - `name` - (Required) The Name of the SKU to use for this Application Gateway. Possible values are `Standard_Small`, `Standard_Medium`, `Standard_Large`, `Standard_v2`, `WAF_Medium`, `WAF_Large`, and `WAF_v2`.
 - `tier` - (Required) The Tier of the SKU to use for this Application Gateway. Possible values are `Standard`, `Standard_v2`, `WAF` and `WAF_v2`.
 - `capacity` - (Optional) The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between `1` and `32`, and `1` to `125` for a V2 SKU. This property is optional if `autoscale_configuration` is set.
DESCRIPTION
  nullable    = false

  validation {
    condition     = can(regex("^(Standard_v2|WAF_v2)$", var.sku.name))
    error_message = "SKU name must be 'Standard_v2' or 'WAF_v2'."
  }
  validation {
    condition     = can(regex("^(Standard_v2|WAF_v2)$", var.sku.tier))
    error_message = "SKU tier must be 'Standard_v2' or 'WAF_v2'."
  }
}

variable "tags" {
  type        = map(string)
  default     = null
  description = "A map of tags to apply to the Application Gateway."
}

variable "waf_firewall_policy" {
  type = map(object({
    waf_name                = string
    waf_resource_group_name = string
  }))
  default     = {}
  description = "The WAF policy name and resource group name to associate with the Application Gateway."
}
