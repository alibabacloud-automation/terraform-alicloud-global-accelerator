
resource "alicloud_ga_accelerator" "accelerator" {
  count               = var.create_accelerator ? 1 : 0
  duration            = var.duration
  pricing_cycle       = var.pricing_cycle
  spec                = var.accelerator_spec
  accelerator_name    = var.accelerator_name
  description         = var.accelerator_description
  auto_use_coupon     = var.auto_use_coupon
  auto_renew_duration = var.auto_renew_duration
  renewal_status      = var.renewal_status
}

resource "alicloud_ga_bandwidth_package" "bandwidth_package" {
  count                     = var.create_bandwidth_package ? 1 : 0
  bandwidth                 = var.bandwidth
  type                      = var.bandwidth_package_type
  bandwidth_type            = var.bandwidth_type
  duration                  = var.duration
  auto_pay                  = var.bandwidth_package_auto_pay
  payment_type              = var.payment_type
  auto_use_coupon           = var.auto_use_coupon
  bandwidth_package_name    = var.bandwidth_package_name
  billing_type              = var.billing_type
  cbn_geographic_region_ida = var.cbn_geographic_region_ida
  cbn_geographic_region_idb = var.cbn_geographic_region_idb
  description               = var.bandwidth_package_description
  ratio                     = var.ratio
}

resource "alicloud_ga_bandwidth_package_attachment" "attachment" {
  count                = var.create_bandwidth_package_attachment ? 1 : 0
  accelerator_id       = local.this_accelerator_id
  bandwidth_package_id = local.this_bandwidth_package_id
}

resource "alicloud_ga_listener" "listener" {
  depends_on      = [alicloud_ga_bandwidth_package_attachment.attachment]
  count           = var.create_listener ? 1 : 0
  accelerator_id  = local.this_accelerator_id
  client_affinity = var.client_affinity
  description     = var.listener_description
  name            = var.listener_name
  proxy_protocol  = var.proxy_protocol
  protocol        = var.protocol
  port_ranges {
    from_port = lookup(var.port_ranges, "from_port", null)
    to_port   = lookup(var.port_ranges, "to_port", null)
  }
}

resource "alicloud_ga_endpoint_group" "endpoint_group" {
  count                         = var.create_endpoint_group ? 1 : 0
  accelerator_id                = local.this_accelerator_id
  listener_id                   = concat(alicloud_ga_listener.listener.*.id, [""])[0]
  endpoint_group_region         = var.endpoint_group_region
  description                   = var.endpoint_group_description
  endpoint_group_type           = var.endpoint_group_type
  endpoint_request_protocol     = var.endpoint_request_protocol
  health_check_interval_seconds = var.health_check_interval_seconds
  health_check_path             = var.health_check_path
  health_check_port             = var.health_check_port
  health_check_protocol         = var.health_check_protocol
  name                          = var.endpoint_group_name
  threshold_count               = var.threshold_count
  traffic_percentage            = var.traffic_percentage
  endpoint_configurations {
    endpoint = lookup(var.endpoint_configurations, "endpoint", null)
    type     = lookup(var.endpoint_configurations, "type", null)
    weight   = lookup(var.endpoint_configurations, "weight", null)
  }
  port_overrides {
    endpoint_port = lookup(var.port_overrides, "endpoint_port", null)
    listener_port = lookup(var.port_overrides, "listener_port", null)
  }
}
