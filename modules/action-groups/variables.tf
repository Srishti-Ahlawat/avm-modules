variable key_vault_name {
  description = "Name of the vault where you put the PagerDuty key"
  type = string
}

variable key_vault_rg_name {
  description = "The resource group associated with the vault"
  type = string
}


variable "action_groups" {
  type = map(object({
    name                = string
    short_name          = string
    resource_group_name = string
    enabled             = bool

    webhook_receivers   = optional(list(object({
      name                    = string
      service_uri             = optional(string)
      use_common_alert_schema = optional(bool, true)
      key_vault_secret_id     = optional(string)
    })))

    email_receivers     = optional(list(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = optional(bool, true)
    })))
  }))
  default = {}
}
