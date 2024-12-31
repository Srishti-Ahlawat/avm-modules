data "azurerm_policy_assignment" "this" {
  for_each = var.policy_assignments

  name     = each.value.policy_assignment_name
  scope_id = each.value.policy_assignment_scope_id
}

resource "azurerm_resource_group_policy_remediation" "this" {
  for_each             = var.policy_assignments
  name                 = each.value.name
  policy_assignment_id = data.azurerm_policy_assignment.this[each.key].id
  resource_group_id    = each.value.resource_group_id

  policy_definition_reference_id = each.value.policy_definition_reference_id
  failure_percentage             = each.value.failure_percentage
  location_filters               = each.value.location_filters
  resource_count                 = each.value.resource_count
  resource_discovery_mode        = each.value.resource_discovery_mode
  parallel_deployments           = each.value.parallel_deployments

}
