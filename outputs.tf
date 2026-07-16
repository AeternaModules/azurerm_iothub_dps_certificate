output "iothub_dps_certificates_id" {
  description = "Map of id values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iothub_dps_certificates_certificate_content" {
  description = "Map of certificate_content values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.certificate_content if v.certificate_content != null && length(v.certificate_content) > 0 }
  sensitive   = true
}
output "iothub_dps_certificates_iot_dps_name" {
  description = "Map of iot_dps_name values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.iot_dps_name if v.iot_dps_name != null && length(v.iot_dps_name) > 0 }
}
output "iothub_dps_certificates_is_verified" {
  description = "Map of is_verified values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.is_verified if v.is_verified != null }
}
output "iothub_dps_certificates_name" {
  description = "Map of name values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "iothub_dps_certificates_resource_group_name" {
  description = "Map of resource_group_name values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}

