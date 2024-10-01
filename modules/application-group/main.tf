module "avm-res-desktopvirtualization-applicationgroup" {
  source   = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
  version  = "0.1.5"
  for_each = var.host_pools

  # Required
  virtual_desktop_application_group_host_pool_id        = each.value.virtual_desktop_application_group_host_pool_id
  virtual_desktop_application_group_name                = each.value.virtual_desktop_application_group_name
  virtual_desktop_application_group_location            = each.value.virtual_desktop_application_group_location
  virtual_desktop_application_group_resource_group_name = each.value.virtual_desktop_application_group_resource_group_name
  virtual_desktop_application_group_type                = each.value.virtual_desktop_application_group_type

  # Optional variables
  virtual_desktop_application_group_description                  = lookup(each.value, "virtual_desktop_application_group_description", null)
  virtual_desktop_application_group_default_desktop_display_name = lookup(each.value, "virtual_desktop_application_group_default_desktop_display_name", null)
  diagnostic_settings                                            = try(lookup(each.value, "diagnostic_settings", {})) != null ? each.value.diagnostic_settings : {}
  enable_telemetry                                               = try(lookup(each.value, "enable_telemetry", true)) != null ? each.value.enable_telemetry : true
  lock                                                           = lookup(each.value, "lock", null) 
  role_assignments                                               = try(lookup(each.value, "role_assignments", {})) != null ? each.value.role_assignments : {}
  tracing_tags_enabled                                           = lookup(each.value, "tracing_tags_enabled", false)
  tracing_tags_prefix                                            = lookup(each.value, "tracing_tags_prefix", "avm_")
  virtual_desktop_application_group_friendly_name                = lookup(each.value, "virtual_desktop_application_group_friendly_name", null)
  virtual_desktop_application_group_tags                         = lookup(each.value, "virtual_desktop_application_group_tags", null)
  virtual_desktop_application_group_timeouts                     = lookup(each.value, "virtual_desktop_application_group_timeouts", null)
}