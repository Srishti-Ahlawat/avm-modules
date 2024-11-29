module "nat_gateway" {
  source      = "../"
  natgateways = var.natgateways
}