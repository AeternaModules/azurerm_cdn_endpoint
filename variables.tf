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
    is_http_allowed               = optional(bool)
    is_https_allowed              = optional(bool)
    optimization_type             = optional(string)
    origin_host_header            = optional(string)
    origin_path                   = optional(string)
    probe_path                    = optional(string)
    querystring_caching_behaviour = optional(string)
    tags                          = optional(map(string))
    origin = list(object({
      host_name  = string
      http_port  = optional(number)
      https_port = optional(number)
      name       = string
    }))
    delivery_rule = optional(list(object({
      cache_expiration_action = optional(object({
        behavior = string
        duration = optional(string)
      }))
      cache_key_query_string_action = optional(object({
        behavior   = string
        parameters = optional(string)
      }))
      cookies_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      })))
      device_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      }))
      http_version_condition = optional(list(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      })))
      modify_request_header_action = optional(list(object({
        action = string
        name   = string
        value  = optional(string)
      })))
      modify_response_header_action = optional(list(object({
        action = string
        name   = string
        value  = optional(string)
      })))
      name  = string
      order = number
      post_arg_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      })))
      query_string_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(list(string))
      })))
      remote_address_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
      })))
      request_body_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(list(string))
      })))
      request_header_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      })))
      request_method_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      }))
      request_scheme_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)
        operator         = optional(string)
      }))
      request_uri_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(list(string))
      })))
      url_file_extension_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(list(string))
      })))
      url_file_name_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(list(string))
      })))
      url_path_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool)
        operator         = string
        transforms       = optional(list(string))
      })))
      url_redirect_action = optional(object({
        fragment      = optional(string)
        hostname      = optional(string)
        path          = optional(string)
        protocol      = optional(string)
        query_string  = optional(string)
        redirect_type = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool)
        source_pattern          = string
      }))
    })))
    geo_filter = optional(list(object({
      action        = string
      country_codes = list(string)
      relative_path = string
    })))
    global_delivery_rule = optional(object({
      cache_expiration_action = optional(object({
        behavior = string
        duration = optional(string)
      }))
      cache_key_query_string_action = optional(object({
        behavior   = string
        parameters = optional(string)
      }))
      modify_request_header_action = optional(list(object({
        action = string
        name   = string
        value  = optional(string)
      })))
      modify_response_header_action = optional(list(object({
        action = string
        name   = string
        value  = optional(string)
      })))
      url_redirect_action = optional(object({
        fragment      = optional(string)
        hostname      = optional(string)
        path          = optional(string)
        protocol      = optional(string)
        query_string  = optional(string)
        redirect_type = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool)
        source_pattern          = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        length(v.origin) >= 1
      )
    ])
    error_message = "Each origin list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.order >= 1)])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.cookies_condition == null || alltrue([for item in item.cookies_condition : (length(trimspace(item.selector)) > 0)]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.cookies_condition == null || alltrue([for item in item.cookies_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.http_version_condition == null || alltrue([for item in item.http_version_condition : (item.operator == null || (contains(["Equal"], item.operator)))]))])
      )
    ])
    error_message = "must be one of: Equal"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.http_version_condition == null || alltrue([for item in item.http_version_condition : (alltrue([for x in item.match_values : contains(["0.9", "1.0", "1.1", "2.0"], x)]))]))])
      )
    ])
    error_message = "must be one of: 0.9, 1.0, 1.1, 2.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.device_condition == null || (item.device_condition.operator == null || (contains(["Equal"], item.device_condition.operator))))])
      )
    ])
    error_message = "must be one of: Equal"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.device_condition == null || (alltrue([for x in item.device_condition.match_values : contains(["Desktop", "Mobile"], x)])))])
      )
    ])
    error_message = "must be one of: Desktop, Mobile"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.post_arg_condition == null || alltrue([for item in item.post_arg_condition : (length(trimspace(item.selector)) > 0)]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.post_arg_condition == null || alltrue([for item in item.post_arg_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.query_string_condition == null || alltrue([for item in item.query_string_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.remote_address_condition == null || alltrue([for item in item.remote_address_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_body_condition == null || alltrue([for item in item.request_body_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_header_condition == null || alltrue([for item in item.request_header_condition : (length(trimspace(item.selector)) > 0)]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_header_condition == null || alltrue([for item in item.request_header_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_method_condition == null || (item.request_method_condition.operator == null || (contains(["Equal"], item.request_method_condition.operator))))])
      )
    ])
    error_message = "must be one of: Equal"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_method_condition == null || (alltrue([for x in item.request_method_condition.match_values : contains(["DELETE", "GET", "HEAD", "OPTIONS", "POST", "PUT"], x)])))])
      )
    ])
    error_message = "must be one of: DELETE, GET, HEAD, OPTIONS, POST, PUT"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_scheme_condition == null || (item.request_scheme_condition.operator == null || (contains(["Equal"], item.request_scheme_condition.operator))))])
      )
    ])
    error_message = "must be one of: Equal"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_scheme_condition == null || (alltrue([for x in item.request_scheme_condition.match_values : contains(["HTTP", "HTTPS"], x)])))])
      )
    ])
    error_message = "must be one of: HTTP, HTTPS"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.request_uri_condition == null || alltrue([for item in item.request_uri_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.url_file_extension_condition == null || alltrue([for item in item.url_file_extension_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.url_file_name_condition == null || alltrue([for item in item.url_file_name_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.delivery_rule == null || alltrue([for item in v.delivery_rule : (item.url_path_condition == null || alltrue([for item in item.url_path_condition : (item.match_values == null || (alltrue([for x in item.match_values : length(trimspace(x)) > 0])))]))])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.cdn_endpoints : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 52 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

