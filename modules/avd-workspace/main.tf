module "avm-res-desktopvirtualization-workspace" {
  source  = "Azure/avm-res-desktopvirtualization-workspace/azurerm"
  version = "0.1.5"
  # insert the 4 required variables here
  for_each = var.workspaces
  virtual_desktop_workspace_name = each.value.virtual_desktop_workspace_name
  virtual_desktop_workspace_resource_group_name = each.value.virtual_desktop_application_group_resource_group_name
  resource_group_name = each.value.resource_group_name
  virtual_desktop_workspace_location = each.value.virtual_desktop_workspace_location
  #optional
  diagnostic_settings = try(each.value.diagnostic_settings,null) != null ? each.value.diagnostic_settings :  {}
  enable_telemetry                                        = try(each.value.enable_telemetry, true) != null ? each.value.enable_telemetry : true
  lock                                                    = try(each.value.lock, null)
  private_endpoints                                       = try(each.value.private_endpoints, {}) != null ? each.value.private_endpoints : {}
  role_assignments                                        = try(each.value.role_assignments, {}) != null ? each.value.role_assignments : {}
  subresource_names                                       = try(each.value.subresource_names, []) != null ? each.value.subresource_names : []
  tags                                                    = try(each.value.tags, {}) != null ? each.value.tags : {}
  tracing_tags_enabled                                    = try(each.value.tracing_tags_enabled, false) != null ? each.value.tracing_tags_enabled : false
  tracing_tags_prefix                                     = try(each.value.tracing_tags_prefix, "avm_") != null ? each.value.tracing_tags_prefix : "avm_"
  virtual_desktop_workspace_description                   = try(each.value.virtual_desktop_workspace_description, null)
  virtual_desktop_workspace_friendly_name                 = try(each.value.virtual_desktop_workspace_friendly_name, null)
  virtual_desktop_workspace_public_network_access_enabled = try(each.value.virtual_desktop_workspace_public_network_access_enabled, null) 
  virtual_desktop_workspace_tags                          = try(each.value.virtual_desktop_workspace_tags, null)
  virtual_desktop_workspace_timeouts                      = try(each.value.virtual_desktop_workspace_timeouts, null)
  }