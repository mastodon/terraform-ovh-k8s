# Mastodon Terraform - OVHCloud Kubernetes Cluster

Terraform module for creating a managed kubernetes cluster in OVHCloud.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ovh"></a> [ovh](#requirement\_ovh) | ~> 2.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 2.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ovh_cloud_project_kube.cluster](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube) | resource |
| [ovh_cloud_project_kube_nodepool.node_pool](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube_nodepool) | resource |
| [ovh_cloud_project_kube_oidc.oidc](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube_oidc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster to create. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubelet version to use when creating the cluster. | `string` | n/a | yes |
| <a name="input_network_openstack_id"></a> [network\_openstack\_id](#input\_network\_openstack\_id) | Openstack ID of the private network in which the cluster should be placed. | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Node pools to create for the cluster. | <pre>list(object({<br>    flavor_name        = string<br>    nodes              = number<br>    min_nodes          = optional(number, 0)<br>    max_nodes          = optional(number, 0)<br>    name               = optional(string, "")<br>    availability_zones = optional(list(string), [])<br>    monthly_billed     = optional(bool, false)<br>    template = optional(<br>      object({<br>        annotations   = optional(map(any), {})<br>        labels        = optional(map(any), {})<br>        finalizers    = optional(list(string), [])<br>        unschedulable = optional(bool, false)<br>        taints = optional(list(object({<br>          effect = string<br>          key    = string<br>          value  = string<br>        })), [])<br>      }),<br>      null<br>    )<br>  }))</pre> | n/a | yes |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | OIDC client ID to give the cluster for login. | `string` | `""` | no |
| <a name="input_oidc_groups_claim"></a> [oidc\_groups\_claim](#input\_oidc\_groups\_claim) | Groups to include in the OIDC claim. | `list(string)` | `[]` | no |
| <a name="input_oidc_groups_prefix"></a> [oidc\_groups\_prefix](#input\_oidc\_groups\_prefix) | Prefix to add to all groups connecting to the cluster. | `string` | `""` | no |
| <a name="input_oidc_provider_url"></a> [oidc\_provider\_url](#input\_oidc\_provider\_url) | URL to use for OIDC authentication. Enables OIDC if specified. | `string` | `""` | no |
| <a name="input_oidc_username_claim"></a> [oidc\_username\_claim](#input\_oidc\_username\_claim) | OIDC Property to use for username. | `string` | `""` | no |
| <a name="input_oidc_username_prefix"></a> [oidc\_username\_prefix](#input\_oidc\_username\_prefix) | Prefix to add to all usernames connecting to the cluster. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the Public Cloud project the resources will be created in. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region in which to create the various resources. | `string` | `"DE1"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the subnet in the private network in which nodes should be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | kubeconfig to use when connecting to the cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the cluster |
| <a name="output_nodes_url"></a> [nodes\_url](#output\_nodes\_url) | URLs of the nodes attached to the cluster |
