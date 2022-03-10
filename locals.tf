locals {
  # Get ID of ga accelerator resources
  this_accelerator_id = var.create_accelerator ? concat(alicloud_ga_accelerator.accelerator.*.id, [""])[0] : var.accelerator_id
  # Get ID of bandwidth package resources  
  this_bandwidth_package_id = var.create_bandwidth_package ? concat(alicloud_ga_bandwidth_package.bandwidth_package.*.id, [""])[0] : var.bandwidth_package_id
}