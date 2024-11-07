module "example-panorama" {
  source = "../"
  
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

}