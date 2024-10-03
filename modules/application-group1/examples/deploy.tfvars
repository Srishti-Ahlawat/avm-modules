application_groups = {
  "app_group_1" = {
    virtual_desktop_application_group_host_pool_id        = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/new1313/providers/Microsoft.DesktopVirtualization/hostPools/test-hostpool-01"
    virtual_desktop_application_group_resource_group_name = "new1313"
    virtual_desktop_application_group_name                = "test12211"
    virtual_desktop_application_group_location            = "eastus"
    virtual_desktop_application_group_type                = "Desktop"
    virtual_desktop_application_group_description         = "Desktop Application Group created through the Hostpool Wizard"
    virtual_desktop_application_group_friendly_name       = "Default Desktop"
  }
  "app_group_2" = {
    host_pool_name                                        = "test-hostpool-01"
    host_pool_resource_group_name                         = "nonprod-01"
    virtual_desktop_application_group_resource_group_name = "new1313"
    virtual_desktop_application_group_name                = "test12212"
    virtual_desktop_application_group_location            = "eastus"
    virtual_desktop_application_group_type                = "Desktop"
    virtual_desktop_application_group_description         = "Desktop Application Group created through the Hostpool Wizard"
    virtual_desktop_application_group_friendly_name       = "Default Desktop"
  }
  "app_group_3" = {
    host_pool_name                                        = "test-hostpool-01"
    host_pool_resource_group_name                         = "nonprod-01"
    virtual_desktop_application_group_host_pool_id        = "/subscriptions/05a4028e-14a9-4f7d-baf3-2629d5a430bc/resourceGroups/nonprod-01/providers/Microsoft.DesktopVirtualization/hostPools/test-hostpool-01"
    virtual_desktop_application_group_resource_group_name = "new1313"
    virtual_desktop_application_group_name                = "test12213"
    virtual_desktop_application_group_location            = "eastus"
    virtual_desktop_application_group_type                = "Desktop"
    virtual_desktop_application_group_description         = "Desktop Application Group created through the Hostpool Wizard"
    virtual_desktop_application_group_friendly_name       = "Default Desktop"
  }
}
