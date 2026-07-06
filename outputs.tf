output "iothub_dps_certificates" {
  description = "All iothub_dps_certificate resources"
  value       = azurerm_iothub_dps_certificate.iothub_dps_certificates
  sensitive   = true
}
output "iothub_dps_certificates_certificate_content" {
  description = "List of certificate_content values across all iothub_dps_certificates"
  value       = [for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : v.certificate_content]
  sensitive   = true
}
output "iothub_dps_certificates_iot_dps_name" {
  description = "List of iot_dps_name values across all iothub_dps_certificates"
  value       = [for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : v.iot_dps_name]
}
output "iothub_dps_certificates_is_verified" {
  description = "List of is_verified values across all iothub_dps_certificates"
  value       = [for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : v.is_verified]
}
output "iothub_dps_certificates_name" {
  description = "List of name values across all iothub_dps_certificates"
  value       = [for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : v.name]
}
output "iothub_dps_certificates_resource_group_name" {
  description = "List of resource_group_name values across all iothub_dps_certificates"
  value       = [for k, v in azurerm_iothub_dps_certificate.iothub_dps_certificates : v.resource_group_name]
}

