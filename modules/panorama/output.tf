output "mgmt_ip_address" {
  description = <<-EOF
  Panorama management IP address. If `public_ip` was `true`, it is a public IP address, otherwise a private IP address.
  EOF
  value       = module.swfw-modules_panorama.mgmt_ip_address
}

output "interfaces" {
  description = "Map of VM-Series network interfaces. Keys are equal to var.interfaces `name` properties."
  value       = module.swfw-modules_panorama.interfaces
}

output "panorama" {
  description = "whole record"
  value = {
    interface       = module.swfw-modules_panorama.interfaces
    mgmt_ip_address = module.swfw-modules_panorama.mgmt_ip_address
  }
}
