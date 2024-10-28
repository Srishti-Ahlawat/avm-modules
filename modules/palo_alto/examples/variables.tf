variable "nva" {
  description = "Configuration for Palo Alto Virtual Network Appliance"
  type = map(object({
    name    = string
    region  = string
    vhub_id = string
  }))
}

variable "firewall" {
  description = "Configuration for Palo Alto Next Generation Firewall"
  type = map(object({
    name                = string
    region              = string
    vhub_id             = string
    resource_group_name = string
    public_ip_id        = string
    panorama_config     = string
  }))
}

variable "routing_intent" {
  description = "Configuration for Virtual Hub Routing Intent"
  type = map(object({
    name         = string
    vhub_id      = string
    policy_name  = string
    destinations = list(string)
    region       = string
  }))
}
