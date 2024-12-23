output "application_gateway_id" {
  description = "The ID of the Azure Application Gateway."
  value       = module.application_gateway.application_gateway_id
}

output "application_gateway_name" {
  description = "The name of the Azure Application Gateway."
  value       = module.application_gateway.application_gateway_name
}

output "backend_address_pools" {
  description = "Information about the backend address pools configured for the Application Gateway."
  value       = module.application_gateway.backend_address_pools
}

output "backend_http_settings" {
  description = "Information about the backend HTTP settings for the Application Gateway."
  value       = module.application_gateway.backend_http_settings
}

output "frontend_port" {
  description = "Information about the frontend ports used by the Application Gateway."
  value       = module.application_gateway.frontend_port
}

output "http_listeners" {
  description = "Information about the HTTP listeners configured for the Application Gateway."
  value       = module.application_gateway.http_listeners
}

output "probes" {
  description = "Information about health probes configured for the Application Gateway."
  value       = module.application_gateway.probes
}

output "public_ip_address" {
  description = "The actual public IP address associated with the Application Gateway."
  value       = module.application_gateway.public_ip_address
}

output "public_ip_id" {
  description = "The ID of the Azure Public IP address associated with the Application Gateway."
  value       = module.application_gateway.public_ip_id
}

output "request_routing_rules" {
  description = "Information about request routing rules defined for the Application Gateway."
  value       = module.application_gateway.request_routing_rules
}

output "resource_id" {
  description = "Resource ID of the Application Gateway."
  value       = module.application_gateway.resource_id
}

output "ssl_certificates" {
  description = "Information about SSL certificates used by the Application Gateway."
  value       = module.application_gateway.ssl_certificates
}

output "tags" {
  description = "The tags applied to the Application Gateway."
  value       = module.application_gateway.tags
}

output "waf_configuration" {
  description = "Information about the Web Application Firewall (WAF) configuration for the Application Gateway."
  value       = module.application_gateway.waf_configuration
}

output "combined_application_gateway" {
  description = "A combined output containing details of the Azure Application Gateway."
  value = {
    application_gateway_id    = module.application_gateway.application_gateway_id
    application_gateway_name  = module.application_gateway.application_gateway_name
    backend_address_pools     = module.application_gateway.backend_address_pools
    backend_http_settings     = module.application_gateway.backend_http_settings
    frontend_port             = module.application_gateway.frontend_port
    http_listeners            = module.application_gateway.http_listeners
    probes                    = module.application_gateway.probes
    public_ip_address         = module.application_gateway.public_ip_address
    public_ip_id              = module.application_gateway.public_ip_id
    request_routing_rules     = module.application_gateway.request_routing_rules
    resource_id               = module.application_gateway.resource_id
    ssl_certificates          = module.application_gateway.ssl_certificates
    tags                      = module.application_gateway.tags
    waf_configuration         = module.application_gateway.waf_configuration
  }
}
