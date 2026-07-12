output "cdn_endpoints_id" {
  description = "Map of id values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.id }
}
output "cdn_endpoints_content_types_to_compress" {
  description = "Map of content_types_to_compress values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.content_types_to_compress }
}
output "cdn_endpoints_delivery_rule" {
  description = "Map of delivery_rule values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.delivery_rule }
}
output "cdn_endpoints_fqdn" {
  description = "Map of fqdn values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.fqdn }
}
output "cdn_endpoints_geo_filter" {
  description = "Map of geo_filter values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.geo_filter }
}
output "cdn_endpoints_global_delivery_rule" {
  description = "Map of global_delivery_rule values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.global_delivery_rule }
}
output "cdn_endpoints_is_compression_enabled" {
  description = "Map of is_compression_enabled values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.is_compression_enabled }
}
output "cdn_endpoints_is_http_allowed" {
  description = "Map of is_http_allowed values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.is_http_allowed }
}
output "cdn_endpoints_is_https_allowed" {
  description = "Map of is_https_allowed values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.is_https_allowed }
}
output "cdn_endpoints_location" {
  description = "Map of location values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.location }
}
output "cdn_endpoints_name" {
  description = "Map of name values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.name }
}
output "cdn_endpoints_optimization_type" {
  description = "Map of optimization_type values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.optimization_type }
}
output "cdn_endpoints_origin" {
  description = "Map of origin values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.origin }
}
output "cdn_endpoints_origin_host_header" {
  description = "Map of origin_host_header values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.origin_host_header }
}
output "cdn_endpoints_origin_path" {
  description = "Map of origin_path values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.origin_path }
}
output "cdn_endpoints_probe_path" {
  description = "Map of probe_path values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.probe_path }
}
output "cdn_endpoints_profile_name" {
  description = "Map of profile_name values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.profile_name }
}
output "cdn_endpoints_querystring_caching_behaviour" {
  description = "Map of querystring_caching_behaviour values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.querystring_caching_behaviour }
}
output "cdn_endpoints_resource_group_name" {
  description = "Map of resource_group_name values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.resource_group_name }
}
output "cdn_endpoints_tags" {
  description = "Map of tags values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.tags }
}

