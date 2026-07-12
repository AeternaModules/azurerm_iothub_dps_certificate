data "azurerm_key_vault_secret" "certificate_content" {
  for_each     = { for k, v in var.iothub_dps_certificates : k => v if v.certificate_content_key_vault_id != null && v.certificate_content_key_vault_secret_name != null }
  name         = each.value.certificate_content_key_vault_secret_name
  key_vault_id = each.value.certificate_content_key_vault_id
}
resource "azurerm_iothub_dps_certificate" "iothub_dps_certificates" {
  for_each = var.iothub_dps_certificates

  certificate_content = each.value.certificate_content != null ? each.value.certificate_content : try(data.azurerm_key_vault_secret.certificate_content[each.key].value, null)
  iot_dps_name        = each.value.iot_dps_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  is_verified         = each.value.is_verified
}

