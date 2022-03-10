Terraform module which creates Global Accelerator resources on Alibaba Cloud

terraform-alicloud-global-accelerator
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云自动化管理和配置全球加速，包括实例、带宽包、监听、终端节点等。

本 Module 支持创建以下资源:

* [alicloud_ga_accelerator](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ga_accelerator)
* [alicloud_ga_bandwidth_package](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ga_bandwidth_package)
* [alicloud_ga_bandwidth_package_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ga_bandwidth_package_attachment)
* [alicloud_ga_endpoint_group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ga_endpoint_group)
* [alicloud_ga_listener](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ga_listener)

## 用法

```hcl
module "example" {
  source                              = "terraform-alicloud-modules/global-accelerator/alicloud"
  #alicloud_ga_accelerator
  create_accelerator                  = true
  accelerator_name                    = "tf-test"
  pricing_cycle                       = "Month"
  accelerator_spec                    = "1"
  #alicloud_ga_bandwidth_package
  create_bandwidth_package            = true
  bandwidth_package_name              = "tf-test"
  bandwidth                           = 20
  bandwidth_package_type              = "Basic"
  payment_type                        = "Subscription"
  billing_type                        = "PayByTraffic"
  ratio                               = 40
  create_bandwidth_package_attachment = true 
  #alicloud_ga_listener
  create_listener                     = true
  listener_name                       = "tf-test"
  port_ranges                         = {
    from_port = 60
    to_port   = 70
  }
  #alicloud_ga_endpoint_group
  create_endpoint_group               = true
  endpoint_group_name                 = "tf-test"
  endpoint_group_region               = "cn-hangzhou"
  endpoint_configurations             = {
    weight   = "20"
    type     = "PublicIp"
    endpoint = "114.23.00.xx"
  }
}
```

## 示例

* [Clickhouse 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-global-accelerator/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.113.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.113.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
