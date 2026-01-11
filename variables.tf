variable "cdn_endpoints" {
  description = <<EOT
Map of cdn_endpoints, attributes below
Required:
    - location
    - name
    - profile_name
    - resource_group_name
    - origin (block):
        - host_name (required)
        - http_port (optional)
        - https_port (optional)
        - name (required)
Optional:
    - content_types_to_compress
    - is_compression_enabled
    - is_http_allowed
    - is_https_allowed
    - optimization_type
    - origin_host_header
    - origin_path
    - probe_path
    - querystring_caching_behaviour
    - tags
    - delivery_rule (block):
        - cache_expiration_action (optional, block):
            - behavior (required)
            - duration (optional)
        - cache_key_query_string_action (optional, block):
            - behavior (required)
            - parameters (optional)
        - cookies_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - selector (required)
            - transforms (optional)
        - device_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - http_version_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - modify_request_header_action (optional, block):
            - action (required)
            - name (required)
            - value (optional)
        - modify_response_header_action (optional, block):
            - action (required)
            - name (required)
            - value (optional)
        - name (required)
        - order (required)
        - post_arg_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - selector (required)
            - transforms (optional)
        - query_string_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - remote_address_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
        - request_body_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - request_header_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - selector (required)
            - transforms (optional)
        - request_method_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - request_scheme_condition (optional, block):
            - match_values (required)
            - negate_condition (optional)
            - operator (optional)
        - request_uri_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - url_file_extension_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - url_file_name_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - url_path_condition (optional, block):
            - match_values (optional)
            - negate_condition (optional)
            - operator (required)
            - transforms (optional)
        - url_redirect_action (optional, block):
            - fragment (optional)
            - hostname (optional)
            - path (optional)
            - protocol (optional)
            - query_string (optional)
            - redirect_type (required)
        - url_rewrite_action (optional, block):
            - destination (required)
            - preserve_unmatched_path (optional)
            - source_pattern (required)
    - geo_filter (block):
        - action (required)
        - country_codes (required)
        - relative_path (required)
    - global_delivery_rule (block):
        - cache_expiration_action (optional, block):
            - behavior (required)
            - duration (optional)
        - cache_key_query_string_action (optional, block):
            - behavior (required)
            - parameters (optional)
        - modify_request_header_action (optional, block):
            - action (required)
            - name (required)
            - value (optional)
        - modify_response_header_action (optional, block):
            - action (required)
            - name (required)
            - value (optional)
        - url_redirect_action (optional, block):
            - fragment (optional)
            - hostname (optional)
            - path (optional)
            - protocol (optional)
            - query_string (optional)
            - redirect_type (required)
        - url_rewrite_action (optional, block):
            - destination (required)
            - preserve_unmatched_path (optional)
            - source_pattern (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    profile_name                  = string
    resource_group_name           = string
    content_types_to_compress     = optional(set(string))
    is_compression_enabled        = optional(bool)
    is_http_allowed               = optional(bool, true)
    is_https_allowed              = optional(bool, true)
    optimization_type             = optional(string)
    origin_host_header            = optional(string)
    origin_path                   = optional(string)
    probe_path                    = optional(string)
    querystring_caching_behaviour = optional(string, "IgnoreQueryString")
    tags                          = optional(map(string))
    origin = object({
      host_name  = string
      http_port  = optional(number, 80)
      https_port = optional(number, 443)
      name       = string
    })
    delivery_rule = optional(object({
      cache_expiration_action = optional(object({
        behavior = string
        duration = optional(string)
      }))
      cache_key_query_string_action = optional(object({
        behavior   = string
        parameters = optional(string)
      }))
      cookies_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      }))
      device_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool, false)
        operator         = optional(string, "Equal")
      }))
      http_version_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool, false)
        operator         = optional(string, "Equal")
      }))
      modify_request_header_action = optional(object({
        action = string
        name   = string
        value  = optional(string)
      }))
      modify_response_header_action = optional(object({
        action = string
        name   = string
        value  = optional(string)
      }))
      name  = string
      order = number
      post_arg_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      }))
      query_string_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        transforms       = optional(list(string))
      }))
      remote_address_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
      }))
      request_body_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        transforms       = optional(list(string))
      }))
      request_header_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      }))
      request_method_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool, false)
        operator         = optional(string, "Equal")
      }))
      request_scheme_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool, false)
        operator         = optional(string, "Equal")
      }))
      request_uri_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        transforms       = optional(list(string))
      }))
      url_file_extension_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        transforms       = optional(list(string))
      }))
      url_file_name_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        transforms       = optional(list(string))
      }))
      url_path_condition = optional(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool, false)
        operator         = string
        transforms       = optional(list(string))
      }))
      url_redirect_action = optional(object({
        fragment      = optional(string)
        hostname      = optional(string)
        path          = optional(string)
        protocol      = optional(string, "MatchRequest")
        query_string  = optional(string)
        redirect_type = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool, true)
        source_pattern          = string
      }))
    }))
    geo_filter = optional(object({
      action        = string
      country_codes = list(string)
      relative_path = string
    }))
    global_delivery_rule = optional(object({
      cache_expiration_action = optional(object({
        behavior = string
        duration = optional(string)
      }))
      cache_key_query_string_action = optional(object({
        behavior   = string
        parameters = optional(string)
      }))
      modify_request_header_action = optional(object({
        action = string
        name   = string
        value  = optional(string)
      }))
      modify_response_header_action = optional(object({
        action = string
        name   = string
        value  = optional(string)
      }))
      url_redirect_action = optional(object({
        fragment      = optional(string)
        hostname      = optional(string)
        path          = optional(string)
        protocol      = optional(string, "MatchRequest")
        query_string  = optional(string)
        redirect_type = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool, true)
        source_pattern          = string
      }))
    }))
  }))
}

