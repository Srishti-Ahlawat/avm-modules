key_vault_name = "kv-test133"
key_vault_rg_name = "test-epac"
action_groups = {
  "action_group_1" = {
    name                = "CriticalAlertsGroup"
    short_name          = "CAG"
    resource_group_name = "test-epac"
    enabled             = true
    webhook_receivers = [
      {
        name                    = "WebhookReceiver1"
        service_uri             = "https://learn.microsoft.com/en-us/"
        use_common_alert_schema = true
        key_vault_secret_id     = null
      }
    ]
    email_receivers = [
      {
        name                    = "EmailReceiver1"
        email_address           = "alerts-team@example.com"
        use_common_alert_schema = true
      }
    ]
  }

  "action_group_2" = {
    name                = "NonCriticalAlertsGroup"
    short_name          = "NCAG"
    resource_group_name = "test-epac"
    enabled             = false
    webhook_receivers   = []
    email_receivers = [
      {
        name                    = "EmailReceiver2"
        email_address           = "non-critical@example.com"
        use_common_alert_schema = false
      }
    ]
  }
}
