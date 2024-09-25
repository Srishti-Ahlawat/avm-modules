#--------------------------------------------------------------
# Looking up integration key from key vault
#--------------------------------------------------------------
data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg_name
}

data "azurerm_key_vault_secret" "pagerduty_integration_key_secret" {
  for_each     = toset(flatten([ for action_group_name, action_group in var.action_groups : [ for webhook in ( action_group.webhook_receivers != null ? action_group.webhook_receivers : [] ) : webhook.key_vault_secret_id != null ? [webhook.key_vault_secret_id] : []] ]))
  name         = each.key
  key_vault_id = data.azurerm_key_vault.kv.id
}


#--------------------------------------------------------------
# Creating necessary action group(s) 
#--------------------------------------------------------------
resource "azurerm_monitor_action_group" "group" {
  for_each = var.action_groups

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  short_name          = each.value.short_name
  enabled             = each.value.enabled
   tags = {
    environment = "production"
  }


  dynamic "webhook_receiver" {
    for_each = each.value.webhook_receivers != null ? toset(each.value.webhook_receivers) : toset([])

    content {
      name                    = lookup(webhook_receiver.value, "name", null)
      service_uri             = lookup(webhook_receiver.value, "service_uri", null) != null ? lookup(webhook_receiver.value, "service_uri", null) : data.azurerm_key_vault_secret.pagerduty_integration_key_secret[webhook_receiver.value.key_vault_secret_id].value
      use_common_alert_schema = lookup(webhook_receiver.value, "use_common_alert_schema", null)
    }
  }

  dynamic "email_receiver" {
    for_each = each.value.email_receivers != null ? toset(each.value.email_receivers) : toset([])

    content {
      name                    = lookup(email_receiver.value, "name", null)
      email_address           = lookup(email_receiver.value, "email_address", null)
      use_common_alert_schema = lookup(email_receiver.value, "use_common_alert_schema", null)
    }
  }
}
