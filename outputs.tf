output "accelerator_id" {
  description = "The resource ID in terraform of Accelerator."
  value       = local.this_accelerator_id
}

output "accelerator_status" {
  description = "The status of the GA instance."
  value       = concat(alicloud_ga_accelerator.accelerator.*.status, [""])[0]
}

output "bandwidth_package_id" {
  description = "The resource ID in terraform of Bandwidth Package."
  value       = local.this_bandwidth_package_id
}

output "bandwidth_package_attachment_id" {
  description = "The resource ID in terraform of Bandwidth Package Attachment."
  value       = concat(alicloud_ga_bandwidth_package_attachment.attachment.*.id, [""])[0]
}

output "bandwidth_package_attachment_accelerators" {
  description = "Accelerators bound with current Bandwidth Package."
  value       = concat(alicloud_ga_bandwidth_package_attachment.attachment.*.accelerators, [""])[0]
}

output "listener_id" {
  description = "The resource ID in terraform of Listener."
  value       = concat(alicloud_ga_listener.listener.*.id, [""])[0]
}

output "endpoint_group_id" {
  description = "The resource ID in terraform of Endpoint Group."
  value       = concat(alicloud_ga_endpoint_group.endpoint_group.*.id, [""])[0]
}