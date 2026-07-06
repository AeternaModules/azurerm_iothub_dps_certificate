variable "iothub_dps_certificates" {
  description = <<EOT
Map of iothub_dps_certificates, attributes below
Required:
    - certificate_content
    - iot_dps_name
    - name
    - resource_group_name
Optional:
    - is_verified
EOT

  type = map(object({
    certificate_content = string
    iot_dps_name        = string
    name                = string
    resource_group_name = string
    is_verified         = optional(bool) # Default: false
  }))
  validation {
    condition = alltrue([
      for k, v in var.iothub_dps_certificates : (
        length(v.certificate_content) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_iothub_dps_certificate's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   [from validate.IoTHubDpsCertificateName: invalid when value == ""]
  #   source:    [from validate.IoTHubDpsCertificateName: invalid when value == ""]
  # path: name
  #   condition: length(value) <= 64
  #   message:   [from validate.IoTHubDpsCertificateName: invalid when len(value) > 64]
  #   source:    [from validate.IoTHubDpsCertificateName: invalid when len(value) > 64]
  # path: name
  #   source:    [from validate.IoTHubDpsCertificateName] !matched
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
  # path: iot_dps_name
  #   source:    [from validate.IoTHubName] !matched
}

