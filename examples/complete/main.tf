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

resource "alicloud_ssl_certificates_service_certificate" "default" {
  certificate_name = "default"
  cert             = <<EOF
-----BEGIN CERTIFICATE-----
MIIDRjCCAq+gAwIBAgIJAJn3ox4K13PoMA0GCSqGSIb3DQEBBQUAMHYxCzAJBgNV
BAYTAkNOMQswCQYDVQQIEwJCSjELMAkGA1UEBxMCQkoxDDAKBgNVBAoTA0FMSTEP
MA0GA1UECxMGQUxJWVVOMQ0wCwYDVQQDEwR0ZXN0MR8wHQYJKoZIhvcNAQkBFhB0
ZXN0QGhvdG1haWwuY29tMB4XDTE0MTEyNDA2MDQyNVoXDTI0MTEyMTA2MDQyNVow
djELMAkGA1UEBhMCQ04xCzAJBgNVBAgTAkJKMQswCQYDVQQHEwJCSjEMMAoGA1UE
ChMDQUxJMQ8wDQYDVQQLEwZBTElZVU4xDTALBgNVBAMTBHRlc3QxHzAdBgkqhkiG
9w0BCQEWEHRlc3RAaG90bWFpbC5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJ
AoGBAM7SS3e9+Nj0HKAsRuIDNSsS3UK6b+62YQb2uuhKrp1HMrOx61WSDR2qkAnB
coG00Uz38EE+9DLYNUVQBK7aSgLP5M1Ak4wr4GqGyCgjejzzh3DshUzLCCy2rook
KOyRTlPX+Q5l7rE1fcSNzgepcae5i2sE1XXXzLRIDIvQxcspAgMBAAGjgdswgdgw
HQYDVR0OBBYEFBdy+OuMsvbkV7R14f0OyoLoh2z4MIGoBgNVHSMEgaAwgZ2AFBdy
+OuMsvbkV7R14f0OyoLoh2z4oXqkeDB2MQswCQYDVQQGEwJDTjELMAkGA1UECBMC
QkoxCzAJBgNVBAcTAkJKMQwwCgYDVQQKEwNBTEkxDzANBgNVBAsTBkFMSVlVTjEN
MAsGA1UEAxMEdGVzdDEfMB0GCSqGSIb3DQEJARYQdGVzdEBob3RtYWlsLmNvbYIJ
AJn3ox4K13PoMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAY7KOsnyT
cQzfhiiG7ASjiPakw5wXoycHt5GCvLG5htp2TKVzgv9QTliA3gtfv6oV4zRZx7X1
Ofi6hVgErtHaXJheuPVeW6eAW8mHBoEfvDAfU3y9waYrtUevSl07643bzKL6v+Qd
DUBTxOAvSYfXTtI90EAxEG/bJJyOm5LqoiA=
-----END CERTIFICATE-----
EOF
  key              = <<EOF
-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQDO0kt3vfjY9BygLEbiAzUrEt1Cum/utmEG9rroSq6dRzKzsetV
kg0dqpAJwXKBtNFM9/BBPvQy2DVFUASu2koCz+TNQJOMK+BqhsgoI3o884dw7IVM
ywgstq6KJCjskU5T1/kOZe6xNX3Ejc4HqXGnuYtrBNV118y0SAyL0MXLKQIDAQAB
AoGAfe3NxbsGKhN42o4bGsKZPQDfeCHMxayGp5bTd10BtQIE/ST4BcJH+ihAS7Bd
6FwQlKzivNd4GP1MckemklCXfsVckdL94e8ZbJl23GdWul3v8V+KndJHqv5zVJmP
hwWoKimwIBTb2s0ctVryr2f18N4hhyFw1yGp0VxclGHkjgECQQD9CvllsnOwHpP4
MdrDHbdb29QrobKyKW8pPcDd+sth+kP6Y8MnCVuAKXCKj5FeIsgVtfluPOsZjPzz
71QQWS1dAkEA0T0KXO8gaBQwJhIoo/w6hy5JGZnrNSpOPp5xvJuMAafs2eyvmhJm
Ev9SN/Pf2VYa1z6FEnBaLOVD6hf6YQIsPQJAX/CZPoW6dzwgvimo1/GcY6eleiWE
qygqjWhsh71e/3bz7yuEAnj5yE3t7Zshcp+dXR3xxGo0eSuLfLFxHgGxwQJAAxf8
9DzQ5NkPkTCJi0sqbl8/03IUKTgT6hcbpWdDXa7m8J3wRr3o5nUB+TPQ5nzAbthM
zWX931YQeACcwhxvHQJBAN5mTzzJD4w4Ma6YTaNHyXakdYfyAWrOkPIWZxfhMfXe
DrlNdiysTI4Dd1dLeErVpjsckAaOW/JDG5PCSwkaMxk=
-----END RSA PRIVATE KEY-----
EOF
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
  cbn_geographic_region_ida           = "China-mainland"
  cbn_geographic_region_idb           = "Global"
  create_bandwidth_package_attachment = true 
  #alicloud_ga_listener
  create_listener                     = true
  listener_name                       = var.listener_name
  listener_description                = var.listener_description
  client_affinity                     = var.client_affinity
  proxy_protocol                      = var.proxy_protocol
  protocol                            = var.protocol
  certificates                        = {
    id = join("-", [alicloud_ssl_certificates_service_certificate.default.id, "cn-hangzhou"])
  }
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
