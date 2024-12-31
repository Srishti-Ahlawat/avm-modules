variable "policy_assignments" {
  description = "A map of policy assignments, each containing the necessary attributes for remediation."
  type = map(object({
    management_group_id            = string
    policy_assignment_name         = string
    name                           = string
    policy_assignment_scope_id     = string
    policy_definition_reference_id = optional(string)
    parallel_deployments           = optional(number)
    failure_percentage             = optional(number)
    location_filters               = optional(list(string))
    resource_count                 = optional(number)
  }))
}
