variable "endpoint_group_region" {
  description = "The region id."
  type        = string
  default     = "cn-hangzhou"
}


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

variable "ssl_cert" {
  description = "The value of ssl cert."
  type        = string
  default     = "-----BEGIN CERTIFICATE-----\nMIID4jCCAsqgAwIBAgIQMQiIsoVBQA6ngOHV3dbINTANBgkqhkiG9w0BAQsFADBe\nMQswCQYDVQQGEwJDTjEOMAwGA1UEChMFTXlTU0wxKzApBgNVBAsTIk15U1NMIFRl\nc3QgUlNBIC0gRm9yIHRlc3QgdXNlIG9ubHkxEjAQBgNVBAMTCU15U1NMLmNvbTAe\nFw0yNDExMjUwNTQ2MTNaFw0yOTExMjQwNTQ2MTNaMCYxCzAJBgNVBAYTAkNOMRcw\nFQYDVQQDEw50Zi1leGFtcGxlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC\nAQoCggEBANzcOoXaKpNg6H4gXe70qVuQGIXPuVN/CrZpQeceft50MwiqjCpVydn6\n0M254CMPqPt8lFHDN+owEcroriKzGMjRxtgGVvcezKvilZzqp0vpNU9KL3DYQ6l6\nBd7KsI7RuiJEBz2ZXyQQuKw4ULikdMhIsyXzN1artuRMyp/01S3lRW9XuWa4lJ/X\nJPA/IAYgjUKT32lTWjpumwjfG6xoT+x4rO8S/e/gzToimIim+3eqzatpSFapVnVT\nWbGB6G+rs6n/m1ITH612Vz03eIM763wM5kEmD8jtr8z4R+QGHMh/xVDgoKpXDbID\nN+Ndszqw8uYH8vEJXEAzxaGJRdY4yC8CAwEAAaOB0zCB0DAOBgNVHQ8BAf8EBAMC\nBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMB8GA1UdIwQYMBaAFCiB\nJgXRNBo/wXMPu5PPFRw/A79/MGMGCCsGAQUFBwEBBFcwVTAhBggrBgEFBQcwAYYV\naHR0cDovL29jc3AubXlzc2wuY29tMDAGCCsGAQUFBzAChiRodHRwOi8vY2EubXlz\nc2wuY29tL215c3NsdGVzdHJzYS5jcnQwGQYDVR0RBBIwEIIOdGYtZXhhbXBsZS5j\nb20wDQYJKoZIhvcNAQELBQADggEBAGdBWZJ37LqK1Q4YqK2yaETbJ/c5WKmxX/+V\nStgRwkwuf9sc6Hzaw0kjZx5Xzq4XdCupnwhXq3FSkkYlCevzM1HZo8mthRYJqGKU\nv/6mYMi2E+dS+vLDWUAzSE4w/wd3hClUrretP8RcUpskVlE1bvitc90ZTJyJt6R2\nT7Uts6+bA3v0hv0FRgeiJIawRdOnuRtsDi2OU/8l8ktP07J0CJ6XkSmeM4RbgAdy\n8FT2vwIEEqabN37mKKnslYqlBnE/OANlxuDlFNiXaw1vKmJo0l0aRE5ga3fm9TRt\nElTnCyO4aDLWDahYWEsr6u7N+87qd7sFdI99H1dkxGruVSCbhC0=\n-----END CERTIFICATE-----\n"
}

variable "ssl_key" {
  description = "The value of ssl key."
  type        = string
  default     = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA3Nw6hdoqk2DofiBd7vSpW5AYhc+5U38KtmlB5x5+3nQzCKqM\nKlXJ2frQzbngIw+o+3yUUcM36jARyuiuIrMYyNHG2AZW9x7Mq+KVnOqnS+k1T0ov\ncNhDqXoF3sqwjtG6IkQHPZlfJBC4rDhQuKR0yEizJfM3Vqu25EzKn/TVLeVFb1e5\nZriUn9ck8D8gBiCNQpPfaVNaOm6bCN8brGhP7His7xL97+DNOiKYiKb7d6rNq2lI\nVqlWdVNZsYHob6uzqf+bUhMfrXZXPTd4gzvrfAzmQSYPyO2vzPhH5AYcyH/FUOCg\nqlcNsgM3412zOrDy5gfy8QlcQDPFoYlF1jjILwIDAQABAoIBADJGFzQ80xA1MPb0\n2yz3mE11YX+kJyVwd7nJ/+xiLrLodG12lO1WFdp+k2Ug+HpCqE6GryRlcabnRkWP\n7YOMjQm5Zq/p0YXzBtfhffj4GRjYfwALfP0M3WoIkqmCLep0pxABuDw3W0bUX5Uk\nRIujM8obclwjHuelsr4JFN6QVq5ZY8OaTU/lMtjJICsbT5lMvl3kkN+DOliTXIv6\njW4l0fmkt6AkkpKrGvOSD+y/7Y1pobBF4rKJEkhK723UsmGkEYZCl1AWxKmATN17\nOohAl+HG4jS+/lIx8R1hEkkQFNUeeqdDmilywbqp1/gDh/692rukK0ySthjCmucr\nRTEy6fECgYEA5je3MAty8dg4lLQDjbTw/2KBZG9KoJ0fHHhuSE9cjVHAiu5Wr8L0\nImf0qvjm30Pk3pAuRllqI0MjmoUoHPebgAP8Xhuo4//Vl6Z3A9n81jgBVvg+To+C\nLRVNq3FvzYZkfiLI98iAiw60eQ3JXrRNkar/S3s4LXEp11eCb9wUdFMCgYEA9Zg9\nTIlSbMJECu2/5qrlFV0Nl/n/fsHm1J5A0h2rAd35+RPZVCBD/H5IFtXwdpSkExxW\nCTlHN5DSo4gfcg6fIOdSzWrj7B4dkUJjptAc3N7AObqf1YWbo/OoAiwwRnOTKkB7\n68o+YS9YLEB/bbY79DxkIz5AVkCp1oI1BpFKITUCgYEAwcImxaL9LRrkFBOl4gBl\nzSuk51jboG5dHuMlPmq85Jvnx4ZtIySbwNFplPRDq6lC2SbUK5VZxS/eqVBkwGyN\nTaMNJk91R9+sbyRFitJPACTGy+HG3uvdjgAeDKs+g+YWciropdL0jRTlQ/UchD6Q\nAoe+slKUp3pU0s7uEyNRe80CgYEAoaUdG4X6sUi/vi2zs9/hPclsTA4oosZ+5oxu\nf501U9pFUDJHRb6i4MpBKn6PcYzt3QI2goWnoSP579aFU+3ZwK9gaYGkGGHN9jCr\nJD0v8hPOk3CJCOGSijux5hQthgFF6HZe2dfYbODbeOzOsmhSV7Nz+VpcwCh5YI18\n1yDDmM0CgYAoxTpWKhw8eAQFmmWV1pgPuTT7rF5QAyqcwjQPeUWhKuA5kyBmpQ5l\nrlYTMoA7DAtYhjBy+OkZWfbST0t6ZNsVGZUj8ryrVI7Vj5i1TxSsI3kVFkyt7WXs\n9aWQrquvpdXetCKXodu+nJKSqL87Q6W4/HAaCboO+8iHZGKjAuFWxQ==\n-----END RSA PRIVATE KEY-----\n"
}
