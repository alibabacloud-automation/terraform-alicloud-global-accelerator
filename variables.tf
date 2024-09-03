#alicloud_ga_accelerator
variable "create_accelerator" {
  description = "Controls if ga accelerator should be created"
  type        = bool
  default     = false
}

variable "accelerator_id" {
  description = "The id of ga accelerator.It will be ignored when create_accelerator = true"
  type        = string
  default     = ""
}

variable "accelerator_name" {
  description = "The specification of ga accelerator name."
  type        = string
  default     = ""
}

variable "accelerator_description" {
  description = "The specification of ga accelerator description."
  type        = string
  default     = ""
}

variable "duration" {
  description = "The subscription duration."
  type        = number
  default     = 1
}

variable "pricing_cycle" {
  description = "The billing cycle of the GA instance.Valid values: Month,Year."
  type        = string
  default     = "Month"
}

variable "accelerator_spec" {
  description = "The instance type of the GA instance. Specification of global acceleration instance, value: 1: Small 1. 2: Small 2. 3: Small 3. 5: Medium 1. 8: Medium 2. 10: Medium 3."
  type        = string
  default     = "1"
}

variable "auto_use_coupon" {
  description = "Use coupons to pay bills automatically. Default value is false. Valid value: true: Use, false: Not used."
  type        = bool
  default     = false
}

variable "auto_renew_duration" {
  description = "Auto renewal period of an instance, in the unit of month. The value range is 1-12."
  type        = number
  default     = 1
}

variable "renewal_status" {
  description = "Whether to renew an accelerator automatically or not. Default to Normal. Valid values:AutoRenewal,Normal,NotRenewal"
  type        = string
  default     = "Normal"
}
#alicloud_ga_bandwidth_package
variable "create_bandwidth_package" {
  description = "Controls if bandwidth package should be created"
  type        = bool
  default     = false
}

variable "bandwidth_package_id" {
  description = "The id of bandwidth package.It will be ignored when create_bandwidth_package = true"
  type        = string
  default     = ""
}

variable "bandwidth_package_name" {
  description = "The specification of bandwidth package name."
  type        = string
  default     = ""
}

variable "bandwidth_package_description" {
  description = "The specification of bandwidth package description."
  type        = string
  default     = ""
}

variable "bandwidth" {
  description = "The bandwidth value of bandwidth packet."
  type        = number
  default     = 20
}

variable "bandwidth_package_type" {
  description = "The type of the bandwidth packet. China station only supports return to basic."
  type        = string
  default     = "Basic"
}

variable "bandwidth_type" {
  description = "The bandwidth type of the bandwidth. Valid values: Advanced, Basic, Enhanced. If type is set to Basic, this parameter is required."
  type        = string
  default     = "Basic"
}

variable "bandwidth_package_auto_pay" {
  description = "Whether to pay automatically. Valid values: false: If automatic payment is not enabled, you need to go to the order center to complete the payment after the order is generated. true: Enable automatic payment, automatic payment order."
  type        = bool
  default     = false
}

variable "payment_type" {
  description = "The payment type of the bandwidth."
  type        = string
  default     = "Subscription"
}

variable "billing_type" {
  description = "The billing type. Valid values: PayBy95, PayByTraffic."
  type        = string
  default     = null
}

variable "cbn_geographic_region_ida" {
  description = "Interworking area A of cross domain acceleration package. Only international stations support returning this parameter. Default value is China-mainland."
  type        = string
  default     = "China-mainland"
}

variable "cbn_geographic_region_idb" {
  description = "Interworking area B of cross domain acceleration package. Only international stations support returning this parameter. Default value is Global."
  type        = string
  default     = "Global"
}

variable "ratio" {
  description = "The minimum percentage for the pay-by-95th-percentile metering method. Valid values: 30 to 100."
  type        = number
  default     = null
}
#alicloud_ga_bandwidth_package_attachment
variable "create_bandwidth_package_attachment" {
  description = "Controls if bandwidth package attachment should be created"
  type        = bool
  default     = false
}

#alicloud_ga_listener
variable "create_listener" {
  description = "Controls if ga listener should be created"
  type        = bool
  default     = false
}

variable "listener_name" {
  description = "The specification of ga listener name."
  type        = string
  default     = ""
}

variable "listener_description" {
  description = "The specification of ga listener description."
  type        = string
  default     = ""
}

variable "certificates" {
  description = "The certificates of the listener.This parameter needs to be configured only for monitoring of the HTTPS protocol."
  type        = map(string)
  default     = {}
}

variable "client_affinity" {
  description = "The clientAffinity of the listener. Default value is NONE. Valid values: NONE,SOURCE_IP"
  type        = string
  default     = "NONE"
}

variable "proxy_protocol" {
  description = "The proxy protocol of the listener. Default value is false"
  type        = bool
  default     = false
}

variable "protocol" {
  description = "Type of network transport protocol monitored. Default value is TCP. Valid values: TCP, UDP, HTTP, HTTPS."
  type        = string
  default     = "TCP"
}

variable "port_ranges" {
  description = "The portRanges of the listener."
  type        = map(number)
  default     = {}
}

#alicloud_ga_endpoint_group
variable "create_endpoint_group" {
  description = "Controls if endpoint group should be created"
  type        = bool
  default     = false
}

variable "endpoint_group_region" {
  description = "The ID of the region where the endpoint group is deployed."
  type        = string
  default     = "cn-hangzhou"
}

variable "endpoint_group_name" {
  description = "The specification of endpoint group name."
  type        = string
  default     = ""
}

variable "endpoint_group_description" {
  description = "The specification of endpoint group description."
  type        = string
  default     = ""
}

variable "endpoint_configurations" {
  description = "The endpointConfigurations of the endpoint group."
  type        = map(string)
  default     = {}
}

variable "endpoint_group_type" {
  description = "The endpoint group type. Valid values: default, virtual. Default value is default."
  type        = string
  default     = "default"
}

variable "endpoint_request_protocol" {
  description = "The endpoint request protocol. Valid value: HTTP, HTTPS."
  type        = string
  default     = "HTTPS"
}

variable "health_check_interval_seconds" {
  description = "The interval between two consecutive health checks. Unit: seconds."
  type        = number
  default     = 120
}

variable "health_check_path" {
  description = "The path specified as the destination of the targets for health checks."
  type        = string
  default     = ""
}

variable "health_check_port" {
  description = "The port that is used for health checks."
  type        = number
  default     = 7001
}

variable "health_check_protocol" {
  description = "The protocol that is used to connect to the targets for health checks. Valid values: http, https, tcp."
  type        = string
  default     = "https"
}

variable "threshold_count" {
  description = "The number of consecutive failed heath checks that must occur before the endpoint is deemed unhealthy. Default value is 3."
  type        = number
  default     = 3
}

variable "traffic_percentage" {
  description = "The weight of the endpoint group when the corresponding listener is associated with multiple endpoint groups."
  type        = number
  default     = 20
}

variable "port_overrides" {
  description = "Mapping between listening port and forwarding port of boarding point."
  type        = map(number)
  default     = {}
}