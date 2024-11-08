module "swfw-modules_panorama" {
  source  = "PaloAltoNetworks/swfw-modules/azurerm//modules/panorama"
  version = "3.2.0"

  # insert the 7 required variables here
  resource_group_name = var.resource_group_name
  name                = var.name
  image               = var.image
  region              = var.region
  virtual_machine     = var.virtual_machine
  authentication      = var.authentication
  interfaces          = var.interfaces

  # optional
  logging_disks = var.logging_disks
  tags          = var.tags
}