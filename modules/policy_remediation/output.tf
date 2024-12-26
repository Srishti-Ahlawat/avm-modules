output "resource_policy_remediation_ids" {
  description = "The IDs of the resource policy remediations."
  value = {
    for k, v in azurerm_resource_policy_remediation.this : k => v.id
  }
}

