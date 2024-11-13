variable "availability_sets" {
  description = "Map of Availability Set configurations"
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    platform_fault_domain_count  = optional(number, 2)
    platform_update_domain_count = optional(number, 5)
    managed                      = optional(bool, true)
    proximity_placement_group_id = optional(string, "")
    tags                         = optional(map(string), {})
  }))
  default = {}
}
