variable "endpoint_group_region" {
  default     = "cn-hangzhou"
}

provider "alicloud" {
  region = var.endpoint_group_region
}

resource "alicloud_eip_address" "eip_address" {
  bandwidth            = "10"
  internet_charge_type = "PayByBandwidth"
}

module "example" {
  source                              = "../.." 
  #alicloud_ga_accelerator
  create_accelerator                  = true
  accelerator_name                    = var.accelerator_name
  accelerator_description             = var.accelerator_description
  pricing_cycle                       = var.pricing_cycle
  accelerator_spec                    = var.accelerator_spec
  auto_use_coupon                     = var.auto_use_coupon
  auto_renew_duration                 = var.auto_renew_duration
  renewal_status                      = var.renewal_status 
  #alicloud_ga_bandwidth_package
  create_bandwidth_package            = true
  bandwidth_package_name              = var.bandwidth_package_name
  bandwidth_package_description       = var.bandwidth_package_description
  bandwidth                           = var.bandwidth
  bandwidth_package_type              = "Basic"
  bandwidth_type                      = var.bandwidth_type
  duration                            = var.duration
  bandwidth_package_auto_pay          = var.bandwidth_package_auto_pay
  payment_type                        = "Subscription"
  billing_type                        = "PayByTraffic"
  cbn_geographic_region_ida           = "China-mainland"
  cbn_geographic_region_idb           = "Global"
  ratio                               = 40
  create_bandwidth_package_attachment = true 
  #alicloud_ga_listener
  create_listener                     = true
  listener_name                       = var.listener_name
  listener_description                = var.listener_description
  client_affinity                     = var.client_affinity
  proxy_protocol                      = var.proxy_protocol
  protocol                            = var.protocol
  certificates                        = var.certificates
  port_ranges                         = var.port_ranges 
  #alicloud_ga_endpoint_group
  create_endpoint_group               = true
  endpoint_group_name                 = var.endpoint_group_name
  endpoint_group_description          = var.endpoint_group_description
  endpoint_group_type                 = "default"
  endpoint_group_region               = "cn-hangzhou"
  endpoint_request_protocol           = var.endpoint_request_protocol
  health_check_interval_seconds       = var.health_check_interval_seconds
  health_check_path                   = var.health_check_path
  health_check_port                   = var.health_check_port
  health_check_protocol               = var.health_check_protocol
  threshold_count                     = var.threshold_count
  traffic_percentage                  = var.traffic_percentage
  port_overrides                      = var.port_overrides
  endpoint_configurations             = {
    weight   = "20"
    type     = "PublicIp"
    endpoint = alicloud_eip_address.eip_address.ip_address
  }
}
