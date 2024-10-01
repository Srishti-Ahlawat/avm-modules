variable "host_pools" {
  type = map(object({
    virtual_desktop_application_group_resource_group_name          = string
    virtual_desktop_application_group_name                         = string
    virtual_desktop_application_group_location                     = string
    virtual_desktop_application_group_type                         = string
    virtual_desktop_application_group_host_pool_id                 = string
    virtual_desktop_application_group_description                  = optional(string)
    virtual_desktop_application_group_default_desktop_display_name = optional(string)
    diagnostic_settings                                            = optional(map(any))
    enable_telemetry                                               = optional(bool)
    lock                                                           = optional(map(any))
    role_assignments                                               = optional(map(any))
    tracing_tags_enabled                                           = optional(bool)
    tracing_tags_prefix                                            = optional(string)
    virtual_desktop_application_group_friendly_name                = optional(string)
    virtual_desktop_application_group_tags                         = optional(map(string))
    virtual_desktop_application_group_timeouts                     = optional(map(string))
  }))
}
