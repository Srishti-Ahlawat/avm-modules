# module "vwan-eastus2" {
#   source    = "github.com/CenturyLink/tf-modules-azure//virtual-wan-hub?ref=2.23.0"
#   vwan_vhub = var.vwan_vhub
#   providers = {
#     azurerm = azurerm.main
#   }
# }

# output "vwanhub" {
#   description = "Map of all module and resource outputs for vwan and hub"

#   value = {
#     vwan-eastus2 = module.vwan-eastus2
#   }
# }