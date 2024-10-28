# variable "region" {
#   description = "Region for resources"
#   type        = string
# }

# variable "rg_name" {
#   description = "Resource group name"
#   type        = string
# }

# variable "vhub_id" {
#   description = "Virtual Hub ID"
#   type        = string
# }

# variable "nva_name" {
#   description = "Name of the network virtual appliance in region"
#   type        = string
# }


# variable "lrs_name" {
#   description = "Name of the local rulestack"
#   type        = string
# }

# variable "fw_name" {
#   description = "Name of the next-generation firewall in region2"
#   type        = string
# }

# variable "panorama_string" {
#   description = "Panorama base64 configuration string"
#   type        = string
# }

# variable "public_ip_id" {
#   description = "Public IP Address ID for the firewall in region2"
#   type        = string
# }

# variable "anti_spyware_profile" {
#   description = "Anti-spyware profile name"
#   type        = string
# }

# variable "anti_virus_profile" {
#   description = "Anti-virus profile name"
#   type        = string
# }

# variable "file_blocking_profile" {
#   description = "File blocking profile name"
#   type        = string
# }

# variable "vulnerability_profile" {
#   description = "Vulnerability profile name"
#   type        = string
# }

# variable "url_filtering_profile" {
#   description = "URL filtering profile name"
#   type        = string
# }

# # Virtual Hub Routing Intent Variables
# variable "routing_intent_name" {
#   description = "Name of the routing intent for the virtual hub"
#   type        = string
# }

# variable "routing_policy_name" {
#   description = "Name of the routing policy"
#   type        = string
# }

# variable "routing_next_hop" {
#   description = "Next hop for routing policy (e.g., 'Internet' or an IP address)"
#   type        = string
#   default     = "Internet"
# }

# variable "routing_destinations" {
#   description = "Destinations for routing policy (e.g., Internet, PrivateTraffic, etc.)"
#   type        = list(string)
#   default     = ["Internet"]
# }

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
