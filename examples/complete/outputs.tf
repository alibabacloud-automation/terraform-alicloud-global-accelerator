output "accelerator_id" {
  description = "The resource ID in terraform of Accelerator."
  value       = module.example.accelerator_id
}

output "accelerator_status" {
  description = "The status of the GA instance."
  value       = module.example.accelerator_status
}

output "bandwidth_package_id" {
  description = "The resource ID in terraform of Bandwidth Package."
  value       = module.example.bandwidth_package_id
}

output "bandwidth_package_attachment_id" {
  description = "The resource ID in terraform of Bandwidth Package Attachment."
  value       = module.example.bandwidth_package_attachment_id

}

output "bandwidth_package_attachment_accelerators" {
  description = "Accelerators bound with current Bandwidth Package."
  value       = module.example.bandwidth_package_attachment_accelerators
}

output "listener_id" {
  description = "The resource ID in terraform of Listener."
  value       = module.example.listener_id
}

output "endpoint_group_id" {
  description = "The resource ID in terraform of Endpoint Group."
  value       = module.example.endpoint_group_id
}

output "eip_address_id" {
  description = "The resource ID in terraform of Address."
  value       = resource.alicloud_eip_address.eip_address.id
}

output "this_eip_address_ip_address" {
  description = "The address of the EIP."
  value       = resource.alicloud_eip_address.eip_address.ip_address
}
