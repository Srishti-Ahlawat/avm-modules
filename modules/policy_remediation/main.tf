data "azurerm_policy_assignment" "this" {
  for_each = var.policy_assignments

  name     = each.value.policy_assignment_name     
  scope_id = each.value.policy_assignment_scope_id 
}

data "azurerm_resources" "this" {
  for_each = var.policy_assignments

  name                = each.value.resource_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_resource_policy_remediation" "this" {
  for_each = var.policy_assignments

  # Required
  name                 = each.value.name
  policy_assignment_id = data.azurerm_policy_assignment.this[each.key].id
  resource_id          = data.azurerm_resources.this[each.key].resources[0].id

  # Optional
  policy_definition_reference_id = each.value.policy_definition_reference_id
  resource_discovery_mode        = each.value.resource_discovery_mode
  parallel_deployments           = each.value.parallel_deployments
  failure_percentage             = each.value.failure_percentage
  location_filters               = each.value.location_filters
  resource_count                 = each.value.resource_count

}
