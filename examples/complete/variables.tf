#alicloud_ga_accelerator
variable "accelerator_name" {
  description = "The specification of ga accelerator name."
  type        = string
  default     = "tf-name"
}

variable "accelerator_description" {
  description = "The specification of ga accelerator description."
  type        = string
  default     = "tf-description"
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
variable "bandwidth_package_name" {
  description = "The specification of bandwidth package name."
  type        = string
  default     = "tf-name"
}

variable "bandwidth_package_description" {
  description = "The specification of bandwidth package description."
  type        = string
  default     = "tf-description"
}

variable "bandwidth" {
  description = "The bandwidth value of bandwidth packet."
  type        = number
  default     = 20
}

variable "bandwidth_type" {
  description = "The bandwidth type of the bandwidth. Valid values: Advanced, Basic, Enhanced. If type is set to Basic, this parameter is required."
  type        = string
  default     = "Basic"
}

variable "bandwidth_package_auto_pay" {
  description = "Whether to pay automatically. Valid values: false: If automatic payment is not enabled, you need to go to the order center to complete the payment after the order is generated. true: Enable automatic payment, automatic payment order."
  type        = bool
  default     = true
}

#alicloud_ga_listener
variable "listener_name" {
  description = "The specification of ga listener name."
  type        = string
  default     = "tfname"
}

variable "listener_description" {
  description = "The specification of ga listener description."
  type        = string
  default     = "tfdescription"
}

variable "port_ranges" {
  description = "The portRanges of the listener."
  type        = map(number)
  default = {
    from_port = 8080
    to_port   = 8080
  }
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
  default     = "HTTPS"
}

#alicloud_ga_endpoint_group
variable "endpoint_group_name" {
  description = "The specification of endpoint group name."
  type        = string
  default     = "tf-name"
}

variable "endpoint_group_description" {
  description = "The specification of endpoint group description."
  type        = string
  default     = "tf-description"
}

variable "endpoint_request_protocol" {
  description = "The endpoint request protocol. Valid value: HTTP, HTTPS."
  type        = string
  default     = null
}

variable "health_check_interval_seconds" {
  description = "The interval between two consecutive health checks. Unit: seconds."
  type        = number
  default     = 4
}

variable "health_check_path" {
  description = "The path specified as the destination of the targets for health checks."
  type        = string
  default     = "/health"
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

variable "port_overrides" {
  description = "Mapping between listening port and forwarding port of boarding point."
  type        = map(number)
  default = {
    endpoint_port = 80
    listener_port = 8080
  }
}

variable "threshold_count" {
  description = "The number of consecutive failed heath checks that must occur before the endpoint is deemed unhealthy. Default value is 3."
  type        = number
  default     = 4
}

variable "traffic_percentage" {
  description = "The weight of the endpoint group when the corresponding listener is associated with multiple endpoint groups."
  type        = number
  default     = 20
}
