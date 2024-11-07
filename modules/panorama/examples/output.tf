output "mgmt_ip_address" {
  description = "Panorama management IP address. If `public_ip` was `true`, it is a public IP address, otherwise a private IP address."
  value       = module.example-panorama.mgmt_ip_address
}

output "interface" {
  description = "Panorama network interface. The `azurerm_network_interface` object."
  value       = module.example-panorama.interface
}