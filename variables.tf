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
    is_http_allowed               = optional(bool) # Default: true
    is_https_allowed              = optional(bool) # Default: true
    optimization_type             = optional(string)
    origin_host_header            = optional(string)
    origin_path                   = optional(string)
    probe_path                    = optional(string)
    querystring_caching_behaviour = optional(string) # Default: "IgnoreQueryString"
    tags                          = optional(map(string))
    origin = list(object({
      host_name  = string
      http_port  = optional(number) # Default: 80
      https_port = optional(number) # Default: 443
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
        negate_condition = optional(bool) # Default: false
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      })))
      device_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      http_version_condition = optional(list(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
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
        negate_condition = optional(bool) # Default: false
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      })))
      query_string_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(list(string))
      })))
      remote_address_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
      })))
      request_body_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(list(string))
      })))
      request_header_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        selector         = string
        transforms       = optional(list(string))
      })))
      request_method_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      request_scheme_condition = optional(object({
        match_values     = set(string)
        negate_condition = optional(bool)   # Default: false
        operator         = optional(string) # Default: "Equal"
      }))
      request_uri_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(list(string))
      })))
      url_file_extension_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(list(string))
      })))
      url_file_name_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(list(string))
      })))
      url_path_condition = optional(list(object({
        match_values     = optional(set(string))
        negate_condition = optional(bool) # Default: false
        operator         = string
        transforms       = optional(list(string))
      })))
      url_redirect_action = optional(object({
        fragment      = optional(string)
        hostname      = optional(string)
        path          = optional(string)
        protocol      = optional(string) # Default: "MatchRequest"
        query_string  = optional(string)
        redirect_type = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool) # Default: true
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
        protocol      = optional(string) # Default: "MatchRequest"
        query_string  = optional(string)
        redirect_type = string
      }))
      url_rewrite_action = optional(object({
        destination             = string
        preserve_unmatched_path = optional(bool) # Default: true
        source_pattern          = string
      }))
    }))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_cdn_endpoint's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: querystring_caching_behaviour
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: geo_filter.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: optimization_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

