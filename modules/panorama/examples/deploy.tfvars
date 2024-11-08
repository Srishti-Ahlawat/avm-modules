# Location
region              = "eastus"
name                = "PanoramaInstance2"
resource_group_name = "test-rg"

interfaces = [
  {
    name                          = "default"
    subnet_id                     = "/subscriptions/subs/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/test131221/subnets/default"
    private_ip_address            = "10.0.0.4"
    create_public_ip              = true
    public_ip_name                = "PanoramaPublicIP"
    public_ip_resource_group_name = "test-rg"
  }
]

virtual_machine = {
  size                          = "Standard_D5_v2"
  zone                          = "1"
  disk_type                     = "StandardSSD_LRS"
  disk_name                     = "my-firewall-vm-disk"
  avset_id                      = null
  capacity_reservation_group_id = null
  allow_extension_operations    = false
  encryption_at_host_enabled    = false
  disk_encryption_set_id        = null
  enable_boot_diagnostics       = true
  boot_diagnostics_storage_uri  = "https://testing13132.blob.core.windows.net"
  identity_type                 = "SystemAssigned"
  identity_ids                  = []
}

image = {
  version                 = "10.0.0"
  publisher               = "paloaltonetworks"
  offer                   = "panorama"
  sku                     = "byol"
  enable_marketplace_plan = true
  custom_id               = null
}

authentication = {
  username                        = "panadmin"
  password                        = null
  disable_password_authentication = true
  ssh_keys = [
    
  ]
}



// ssh "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDV5QVpitQcVO1GaH6g+yZ3ZWLX6qwCQaPMZM2scdzLMtyA3zb+ZzLolCYeS+3ijreQLJLZBoUE8XqVZgRRTLPzCa+pxJqz7hZPGeWggaLseE8pvsV17XEUXfHBiboXsDCiynwI9PbndLISI37HwDOzJetSYgrDWnrCU9DqRZ9oB8WoSmnQLY1oHtugJprBTuXuCwOXNxv1ZxCwtytFw23RnJsf6Uz1/rvNXDhJd2gd5vWWClRt8wMHGoTMSKeqIlPrl76pM4c+oik7qQlPtBdyU7iJFKg4jOJNKrhKRHE7J2bBpaNffYNEEaf8jkl+fPXMpdOJ36ivI+e3PIqDmZ0R redmond\\srahlawat@DESKTOP-H9UPNAK"