variable "scc_mute_configs" {
  description = <<EOT
Map of scc_mute_configs, attributes below
Required:
    - filter
    - mute_config_id
    - parent
Optional:
    - deletion_policy
    - description
    - expiry_time
    - type
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    filter          = string
    mute_config_id  = string
    parent          = string
    deletion_policy = optional(string)
    description     = optional(string)
    expiry_time     = optional(string)
    type            = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

