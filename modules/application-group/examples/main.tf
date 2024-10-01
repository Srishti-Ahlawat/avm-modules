module "avd-app-group" {
  source     = "../"
  host_pools = var.host_pools
  }