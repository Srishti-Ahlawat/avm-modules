locals {
 # naming = "${var.resourcetype}${var.appname}${var.env}"
  mandatory_tags = tomap({
    environment         = var.environment
    app_id              = var.app_id
    msftmigration       = var.msftmigration
  })

  tags = merge(var.tags, local.mandatory_tags)
}