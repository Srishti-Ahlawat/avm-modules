# Location
location = "eastus"

# Enable Availability Zones
enable_zones = true
avzone       = "1"
avzones      = ["1", "2", "3"]

# Naming
panorama_name       = "PanoramaInstance"
os_disk_name        = "PanoramaOSDisk"
resource_group_name = "PanoramaResourceGroup"

# Instance settings
panorama_size = "Standard_D5_v2"
username      = "panadmin"
password      = "SecureP@ssword123" # Set this to a secure password
ssh_keys = [
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC...",
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
]

# Plan and Disk Configuration
enable_plan        = true
panorama_disk_type = "StandardSSD_LRS"
panorama_sku       = "byol"
panorama_version   = "10.0.3"
panorama_publisher = "paloaltonetworks"
panorama_offer     = "panorama"
custom_image_id    = null

# Networking Configuration
interface = [
  {
    name                 = "mgmt"
    subnet_id            = "/subscriptions/xxxx-xxxx-xxxx-xxxx/resourceGroups/PanoramaResourceGroup/providers/Microsoft.Network/virtualNetworks/myVnet/subnets/mgmt"
    private_ip_address   = ""
    public_ip            = true
    public_ip_name       = "PanoramaPublicIP"
    enable_ip_forwarding = false
  }
]

# Storage Configuration
logging_disks = {
  "logs-1" = {
    size      = 2048
    zone      = "1"
    lun       = 1
    disk_type = "StandardSSD_LRS"
  },
  "logs-2" = {
    size      = 2048
    zone      = "2"
    lun       = 2
    disk_type = "StandardSSD_LRS"
  }
}

# Diagnostic Storage
boot_diagnostic_storage_uri = "https://mystorageaccount.blob.core.windows.net/"

# Tags
tags = {
  Environment = "Production"
  Project     = "PanoramaDeployment"
}
