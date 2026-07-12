output "iothub_dps_certificates_id" {
  description = "Map of id values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.id }
}
output "iothub_dps_certificates_certificate_content" {
  description = "Map of certificate_content values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.certificate_content }
  sensitive   = true
}
output "iothub_dps_certificates_iot_dps_name" {
  description = "Map of iot_dps_name values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.iot_dps_name }
}
output "iothub_dps_certificates_is_verified" {
  description = "Map of is_verified values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.is_verified }
}
output "iothub_dps_certificates_name" {
  description = "Map of name values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.name }
}
output "iothub_dps_certificates_resource_group_name" {
  description = "Map of resource_group_name values across all iothub_dps_certificates, keyed the same as var.iothub_dps_certificates"
  value       = { for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : k => v.resource_group_name }
}

