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
  # path: global_delivery_rule.cache_expiration_action.behavior
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: global_delivery_rule.cache_expiration_action.duration
  #   source:    validate.RuleActionCacheExpirationDuration: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: global_delivery_rule.cache_key_query_string_action.behavior
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: global_delivery_rule.modify_request_header_action.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: global_delivery_rule.modify_response_header_action.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: global_delivery_rule.url_redirect_action.redirect_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: global_delivery_rule.url_redirect_action.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: global_delivery_rule.url_redirect_action.path
  #   source:    validate.RuleActionUrlRedirectPath: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: global_delivery_rule.url_redirect_action.query_string
  #   source:    validate.RuleActionUrlRedirectQueryString: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: global_delivery_rule.url_redirect_action.fragment
  #   source:    validate.RuleActionUrlRedirectFragment: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: global_delivery_rule.url_rewrite_action.source_pattern
  #   source:    validate.RuleActionUrlRewriteSourcePattern: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: global_delivery_rule.url_rewrite_action.destination
  #   source:    validate.RuleActionUrlRewriteDestination: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.name
  #   source:    validate.EndpointDeliveryRuleName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.order
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: delivery_rule.cookies_condition.selector
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.cookies_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.cookies_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.cookies_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.http_version_condition.operator
  #   condition: contains(["Equal"], value)
  #   message:   must be one of: Equal
  # path: delivery_rule.http_version_condition.match_values[*]
  #   condition: contains(["0.9", "1.0", "1.1", "2.0"], value)
  #   message:   must be one of: 0.9, 1.0, 1.1, 2.0
  # path: delivery_rule.device_condition.operator
  #   condition: contains(["Equal"], value)
  #   message:   must be one of: Equal
  # path: delivery_rule.device_condition.match_values[*]
  #   condition: contains(["Desktop", "Mobile"], value)
  #   message:   must be one of: Desktop, Mobile
  # path: delivery_rule.post_arg_condition.selector
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.post_arg_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.post_arg_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.post_arg_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.query_string_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.query_string_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.query_string_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.remote_address_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.remote_address_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.request_body_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.request_body_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.request_body_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.request_header_condition.selector
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.request_header_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.request_header_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.request_header_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.request_method_condition.operator
  #   condition: contains(["Equal"], value)
  #   message:   must be one of: Equal
  # path: delivery_rule.request_method_condition.match_values[*]
  #   condition: contains(["DELETE", "GET", "HEAD", "OPTIONS", "POST", "PUT"], value)
  #   message:   must be one of: DELETE, GET, HEAD, OPTIONS, POST, PUT
  # path: delivery_rule.request_scheme_condition.operator
  #   condition: contains(["Equal"], value)
  #   message:   must be one of: Equal
  # path: delivery_rule.request_scheme_condition.match_values[*]
  #   condition: contains(["HTTP", "HTTPS"], value)
  #   message:   must be one of: HTTP, HTTPS
  # path: delivery_rule.request_uri_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.request_uri_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.request_uri_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_file_extension_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_file_extension_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.url_file_extension_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_file_name_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_file_name_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.url_file_name_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_path_condition.operator
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_path_condition.match_values[*]
  #   source:    validation.StringIsNotWhiteSpace(...) - no translation rule yet, add one
  # path: delivery_rule.url_path_condition.transforms[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.cache_expiration_action.behavior
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.cache_expiration_action.duration
  #   source:    validate.RuleActionCacheExpirationDuration: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.cache_key_query_string_action.behavior
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.modify_request_header_action.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.modify_response_header_action.action
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_redirect_action.redirect_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_redirect_action.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: delivery_rule.url_redirect_action.path
  #   source:    validate.RuleActionUrlRedirectPath: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.url_redirect_action.query_string
  #   source:    validate.RuleActionUrlRedirectQueryString: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.url_redirect_action.fragment
  #   source:    validate.RuleActionUrlRedirectFragment: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.url_rewrite_action.source_pattern
  #   source:    validate.RuleActionUrlRewriteSourcePattern: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: delivery_rule.url_rewrite_action.destination
  #   source:    validate.RuleActionUrlRewriteDestination: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
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

