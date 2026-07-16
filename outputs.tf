output "cdn_endpoints_id" {
  description = "Map of id values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cdn_endpoints_content_types_to_compress" {
  description = "Map of content_types_to_compress values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.content_types_to_compress if v.content_types_to_compress != null && length(v.content_types_to_compress) > 0 }
}
output "cdn_endpoints_delivery_rule" {
  description = "Map of delivery_rule values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.delivery_rule if v.delivery_rule != null && length(v.delivery_rule) > 0 }
}
output "cdn_endpoints_fqdn" {
  description = "Map of fqdn values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.fqdn if v.fqdn != null && length(v.fqdn) > 0 }
}
output "cdn_endpoints_geo_filter" {
  description = "Map of geo_filter values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.geo_filter if v.geo_filter != null && length(v.geo_filter) > 0 }
}
output "cdn_endpoints_global_delivery_rule" {
  description = "Map of global_delivery_rule values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.global_delivery_rule if v.global_delivery_rule != null && length(v.global_delivery_rule) > 0 }
}
output "cdn_endpoints_is_compression_enabled" {
  description = "Map of is_compression_enabled values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.is_compression_enabled if v.is_compression_enabled != null }
}
output "cdn_endpoints_is_http_allowed" {
  description = "Map of is_http_allowed values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.is_http_allowed if v.is_http_allowed != null }
}
output "cdn_endpoints_is_https_allowed" {
  description = "Map of is_https_allowed values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.is_https_allowed if v.is_https_allowed != null }
}
output "cdn_endpoints_location" {
  description = "Map of location values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.location if v.location != null && length(v.location) > 0 }
}
output "cdn_endpoints_name" {
  description = "Map of name values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cdn_endpoints_optimization_type" {
  description = "Map of optimization_type values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.optimization_type if v.optimization_type != null && length(v.optimization_type) > 0 }
}
output "cdn_endpoints_origin" {
  description = "Map of origin values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.origin if v.origin != null && length(v.origin) > 0 }
}
output "cdn_endpoints_origin_host_header" {
  description = "Map of origin_host_header values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.origin_host_header if v.origin_host_header != null && length(v.origin_host_header) > 0 }
}
output "cdn_endpoints_origin_path" {
  description = "Map of origin_path values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.origin_path if v.origin_path != null && length(v.origin_path) > 0 }
}
output "cdn_endpoints_probe_path" {
  description = "Map of probe_path values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.probe_path if v.probe_path != null && length(v.probe_path) > 0 }
}
output "cdn_endpoints_profile_name" {
  description = "Map of profile_name values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.profile_name if v.profile_name != null && length(v.profile_name) > 0 }
}
output "cdn_endpoints_querystring_caching_behaviour" {
  description = "Map of querystring_caching_behaviour values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.querystring_caching_behaviour if v.querystring_caching_behaviour != null && length(v.querystring_caching_behaviour) > 0 }
}
output "cdn_endpoints_resource_group_name" {
  description = "Map of resource_group_name values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "cdn_endpoints_tags" {
  description = "Map of tags values across all cdn_endpoints, keyed the same as var.cdn_endpoints"
  value       = { for k, v in azurerm_cdn_endpoint.cdn_endpoints : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

