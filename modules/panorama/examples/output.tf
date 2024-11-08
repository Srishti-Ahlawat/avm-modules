output "mgmt_ip_address" {
  description = "Panorama management IP address. If `public_ip` was `true`, it is a public IP address, otherwise a private IP address."
  value       = module.panorama-example.mgmt_ip_address
}

output "interface" {
  description = "Panorama network interface. The `azurerm_network_interface` object."
  value       = module.panorama-example.interfaces
}

output "panorama" {
  value = {
    interface       = module.panorama-example.interfaces
    mgmt_ip_address = module.panorama-example.mgmt_ip_address
  }
}
