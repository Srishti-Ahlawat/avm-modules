# resource "azurerm_resource_group" "rg" {

#   name     = "terraform-rg"

#   location = "East US"

# }

# resource "azurerm_public_ip" "cngfw-pip-eastus" {

#   name                = "cngfw-pip-eastus"

#   resource_group_name = "terraform-rg"

#   location            = var.region1

#   allocation_method   = "Static"

#   sku = "Standard"

# }

# resource "azurerm_palo_alto_virtual_network_appliance" "appliance" {
#   name           = var.nva_name
#   virtual_hub_id = var.vhub_id
# }

# # resource "azurerm_palo_alto_local_rulestack" "local-rulestack" {
# #   name                  = var.lrs_name
# #   resource_group_name   = var.rg_name
# #   location              = var.region
# #   anti_spyware_profile  = var.anti_spyware_profile
# #   anti_virus_profile    = var.anti_virus_profile
# #   file_blocking_profile = var.file_blocking_profile
# #   vulnerability_profile = var.vulnerability_profile
# #   url_filtering_profile = var.url_filtering_profile
# # }

# resource "azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama" "palo_fw" {
#   name                = var.fw_name
#   resource_group_name = var.rg_name
#   location            = var.region

#   network_profile {
#     public_ip_address_ids        = [var.public_ip_id]
#     virtual_hub_id               = var.vhub_id
#     network_virtual_appliance_id = azurerm_palo_alto_virtual_network_appliance.appliance.id
#   }

#   panorama_base64_config = var.panorama_string
# }

# resource "azurerm_virtual_hub_routing_intent" "routing_intent" {
#   name           = var.routing_intent_name
#   virtual_hub_id = var.vhub_id

#   routing_policy {
#     name        = var.routing_policy_name
#     next_hop    = azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama.palo_fw.id
#     destinations = var.routing_destinations
#   }
# }


# Palo Alto Virtual Network Appliance
resource "azurerm_palo_alto_virtual_network_appliance" "appliance" {
  for_each       = var.nva
  name           = each.value.name
  virtual_hub_id = each.value.vhub_id
}

# Palo Alto Next Generation Firewall with Panorama
resource "azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama" "palo_fw" {
  for_each             = var.firewall
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.region

  network_profile {
    public_ip_address_ids        = [each.value.public_ip_id]
    virtual_hub_id               = each.value.vhub_id
    network_virtual_appliance_id = azurerm_palo_alto_virtual_network_appliance.appliance[each.value.region].id
  }

  panorama_base64_config = each.value.panorama_config
}

# Virtual Hub Routing Intent
resource "azurerm_virtual_hub_routing_intent" "routing_intent" {
  for_each       = var.routing_intent
  name           = each.value.name
  virtual_hub_id = each.value.vhub_id

  routing_policy {
    name         = each.value.policy_name
    next_hop     = azurerm_palo_alto_next_generation_firewall_virtual_hub_panorama.palo_fw[each.value.region].id
    destinations = each.value.destinations
  }
}
