output "cdn_endpoints" {
  description = "All cdn_endpoint resources"
  value       = azurerm_cdn_endpoint.cdn_endpoints
}
output "cdn_endpoints_content_types_to_compress" {
  description = "List of content_types_to_compress values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.content_types_to_compress]
}
output "cdn_endpoints_delivery_rule" {
  description = "List of delivery_rule values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.delivery_rule]
}
output "cdn_endpoints_fqdn" {
  description = "List of fqdn values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.fqdn]
}
output "cdn_endpoints_geo_filter" {
  description = "List of geo_filter values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.geo_filter]
}
output "cdn_endpoints_global_delivery_rule" {
  description = "List of global_delivery_rule values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.global_delivery_rule]
}
output "cdn_endpoints_is_compression_enabled" {
  description = "List of is_compression_enabled values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.is_compression_enabled]
}
output "cdn_endpoints_is_http_allowed" {
  description = "List of is_http_allowed values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.is_http_allowed]
}
output "cdn_endpoints_is_https_allowed" {
  description = "List of is_https_allowed values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.is_https_allowed]
}
output "cdn_endpoints_location" {
  description = "List of location values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.location]
}
output "cdn_endpoints_name" {
  description = "List of name values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.name]
}
output "cdn_endpoints_optimization_type" {
  description = "List of optimization_type values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.optimization_type]
}
output "cdn_endpoints_origin" {
  description = "List of origin values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.origin]
}
output "cdn_endpoints_origin_host_header" {
  description = "List of origin_host_header values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.origin_host_header]
}
output "cdn_endpoints_origin_path" {
  description = "List of origin_path values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.origin_path]
}
output "cdn_endpoints_probe_path" {
  description = "List of probe_path values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.probe_path]
}
output "cdn_endpoints_profile_name" {
  description = "List of profile_name values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.profile_name]
}
output "cdn_endpoints_querystring_caching_behaviour" {
  description = "List of querystring_caching_behaviour values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.querystring_caching_behaviour]
}
output "cdn_endpoints_resource_group_name" {
  description = "List of resource_group_name values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.resource_group_name]
}
output "cdn_endpoints_tags" {
  description = "List of tags values across all cdn_endpoints"
  value       = [for k, v in azurerm_cdn_endpoint.cdn_endpoints : v.tags]
}

