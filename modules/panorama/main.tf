module "vmseries-modules_panorama" {
  source  = "PaloAltoNetworks/vmseries-modules/azurerm//modules/panorama"
  version = "0.5.1"
 
  # insert the 4 required variables here
  location            = var.location
  resource_group_name = var.resource_group_name
  panorama_name       = var.panorama_name
  interface           = var.interface

  # Optional
  avzone                      = var.avzone
  panorama_size               = var.panorama_size
  username                    = var.username
  password                    = var.password
  panorama_sku                = var.panorama_sku
  panorama_version            = var.panorama_version
  boot_diagnostic_storage_uri = var.boot_diagnostic_storage_uri
  tags                        = var.tags
  panorama_offer              = var.panorama_offer
  ssh_keys                    = var.ssh_keys
  custom_image_id             = var.custom_image_id
  enable_zones                = var.enable_zones
  avzones                     = var.avzones
  os_disk_name                = var.os_disk_name
  enable_plan                 = var.enable_plan
  panorama_disk_type          = var.panorama_disk_type
  panorama_publisher          = var.panorama_publisher
  logging_disks               = var.logging_disks
}
