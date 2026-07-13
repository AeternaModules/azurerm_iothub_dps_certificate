variable "iothub_dps_certificates" {
  description = <<EOT
Map of iothub_dps_certificates, attributes below
Required:
    - certificate_content
    - certificate_content_key_vault_id (optional, alternative to certificate_content)
    - certificate_content_key_vault_secret_name (optional, alternative to certificate_content)
    - iot_dps_name
    - name
    - resource_group_name
Optional:
    - is_verified
EOT

  type = map(object({
    certificate_content                       = string
    certificate_content_key_vault_id          = optional(string)
    certificate_content_key_vault_secret_name = optional(string)
    iot_dps_name                              = string
    name                                      = string
    resource_group_name                       = string
    is_verified                               = optional(bool)
  }))
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        length(v.name) > 0
      )
    ])
    error_message = "[from validate.IoTHubDpsCertificateName: invalid when value == \"\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        length(v.name) <= 64
      )
    ])
    error_message = "[from validate.IoTHubDpsCertificateName: invalid when len(value) > 64]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        length(v.certificate_content) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

