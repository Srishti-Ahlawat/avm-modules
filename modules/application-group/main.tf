module "avm-res-desktopvirtualization-applicationgroup" {
  source   = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
  version  = "0.1.5"
  for_each = var.application_groups

  # Required
  virtual_desktop_application_group_host_pool_id        = each.value.virtual_desktop_application_group_host_pool_id
  virtual_desktop_application_group_name                = each.value.virtual_desktop_application_group_name
  virtual_desktop_application_group_location            = each.value.virtual_desktop_application_group_location
  virtual_desktop_application_group_resource_group_name = each.value.virtual_desktop_application_group_resource_group_name
  virtual_desktop_application_group_type                = each.value.virtual_desktop_application_group_type

  # Optional variables
  virtual_desktop_application_group_description                  = try(each.value.virtual_desktop_application_group_description, null)
  virtual_desktop_application_group_default_desktop_display_name = try(each.value.virtual_desktop_application_group_default_desktop_display_name, null)
  diagnostic_settings                                            = try(each.value.diagnostic_settings, null) != null ? each.value.diagnostic_settings : {}
  enable_telemetry                                               = try(each.value.enable_telemetry, null) != null ? each.value.enable_telemetry : true
  lock                                                           = try(each.value.lock, null)
  role_assignments                                               = try(each.value.role_assignments, null) != null ? each.value.role_assignments : {}
  tracing_tags_enabled                                           = try(each.value.tracing_tags_enabled, null) != null ? each.value.tracing_tags_enabled : false 
  tracing_tags_prefix                                            = try(each.value.tracing_tags_prefix, "avm_") != null ? each.value.tracing_tags_prefix : "avm_"
  virtual_desktop_application_group_friendly_name                = try(each.value.virtual_desktop_application_group_friendly_name, null)
  virtual_desktop_application_group_tags                         = try(each.value.virtual_desktop_application_group_tags, null)
  virtual_desktop_application_group_timeouts                     = try(each.value.virtual_desktop_application_group_timeouts, null)
}
