module "panorama-example" {
  source = "../"

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