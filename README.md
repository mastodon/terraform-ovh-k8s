# Mastodon Terraform - OVHCloud Kubernetes Cluster

Terraform module for creating a managed kubernetes cluster in OVHCloud.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 0.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ovh_cloud_project_gateway.gateway](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_gateway) | resource |
| [ovh_cloud_project_kube.cluster](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube) | resource |
| [ovh_cloud_project_kube_nodepool.node_pool](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube_nodepool) | resource |
| [ovh_cloud_project_kube_oidc.oidc](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_kube_oidc) | resource |
| [ovh_cloud_project_network_private.net](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_network_private) | resource |
| [ovh_cloud_project_network_private_subnet.subnet](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_network_private_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the cluster to create. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Kubelet version to use when creating the cluster. | `string` | n/a | yes |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | Subnet to assign to the private network. | `string` | n/a | yes |
| <a name="input_network_gateway_model"></a> [network\_gateway\_model](#input\_network\_gateway\_model) | Size of the gateway to use for the private network. | `string` | `"s"` | no |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Node pools to create for the cluster. | <pre>list(object({<br>    flavor_name    = string<br>    nodes          = number<br>    name           = optional(string, "")<br>    template       = optional(map(any), {})<br>    monthly_billed = optional(bool, false)<br>  }))</pre> | n/a | yes |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | OIDC client ID to give the cluster for login. | `string` | `""` | no |
| <a name="input_oidc_groups_claim"></a> [oidc\_groups\_claim](#input\_oidc\_groups\_claim) | Groups to include in the OIDC claim. | `list(string)` | `[]` | no |
| <a name="input_oidc_groups_prefix"></a> [oidc\_groups\_prefix](#input\_oidc\_groups\_prefix) | Prefix to add to all groups connecting to the cluster. | `string` | `""` | no |
| <a name="input_oidc_provider_url"></a> [oidc\_provider\_url](#input\_oidc\_provider\_url) | URL to use for OIDC authentication. Enables OIDC if specified. | `string` | `""` | no |
| <a name="input_oidc_username_claim"></a> [oidc\_username\_claim](#input\_oidc\_username\_claim) | OIDC Property to use for username. | `string` | `""` | no |
| <a name="input_oidc_username_prefix"></a> [oidc\_username\_prefix](#input\_oidc\_username\_prefix) | Prefix to add to all usernames connecting to the cluster. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the Public Cloud project the resources will be created in. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region in which to create the various resources. | `string` | `"DE1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster |
| <a name="output_kubeconfig"></a> [kubeconfig](#output\_kubeconfig) | kubeconfig to use when connecting to the cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the cluster |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the private network created for the cluster. |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the private network created for the cluster. |
| <a name="output_nodes_url"></a> [nodes\_url](#output\_nodes\_url) | URLs of the nodes attached to the cluster |
| <a name="output_openstackID"></a> [openstackID](#output\_openstackID) | n/a |
| <a name="output_vlan_id"></a> [vlan\_id](#output\_vlan\_id) | VLAN ID of the private network created for the cluster. |
