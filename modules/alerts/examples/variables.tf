variable "metric_alerts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    scopes                   = list(string)
    description              = string
    enabled                  = optional(bool)
    auto_mitigate            = optional(bool)
    frequency                = optional(string)
    severity                 = optional(number)
    target_resource_type     = optional(string)
    target_resource_location = optional(string)
    window_size              = optional(string)
    actions_group_ids        = list(string)

    criteria = map(object({
      metric_namespace = string
      metric_name      = string
      aggregation      = string
      operator         = string
      threshold        = string

      dimension = optional(map(object({
        name     = string
        operator = string
        values   = list(string)
      })))
    }))
  }))
}
