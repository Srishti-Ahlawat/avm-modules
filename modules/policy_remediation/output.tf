output "resource_policy_remediation_ids" {
  description = "The IDs of the resource policy remediations."
  value = {
    for k, v in azurerm_management_group_policy_remediation.this : k => v.id
  }
}

