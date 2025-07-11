resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.project_id
  name         = var.cluster_name
  region       = var.region
  version      = var.cluster_version

  private_network_id = var.network_openstack_id
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  count = length(var.node_pools)

  service_name       = var.project_id
  kube_id            = ovh_cloud_project_kube.cluster.id
  name               = var.node_pools[count.index].name != "" ? var.node_pools[count.index].name : "pool${count.index}"
  flavor_name        = var.node_pools[count.index].flavor_name
  desired_nodes      = var.node_pools[count.index].nodes
  max_nodes          = var.node_pools[count.index].max_nodes < 1 ? var.node_pools[count.index].nodes : var.node_pools[count.index].max_nodes
  min_nodes          = var.node_pools[count.index].min_nodes < 1 ? var.node_pools[count.index].nodes : var.node_pools[count.index].min_nodes
  monthly_billed     = var.node_pools[count.index].monthly_billed
  availability_zones = var.node_pools[count.index].availability_zones

  dynamic "template" {
    for_each = var.node_pools[count.index].template

    content {
      metadata {
        annotations = var.node_pools[count.index].template.value["annotations"]
        finalizers  = var.node_pools[count.index].template.value["finalizers"]
        labels      = var.node_pools[count.index].template.value["labels"]
      }
      spec {
        unschedulable = var.node_pools[count.index].template.value["unschedulable"]
        taints        = var.node_pools[count.index].template.value["taints"]
      }
    }
  }
}

resource "ovh_cloud_project_kube_oidc" "oidc" {
  count = var.oidc_provider_url != "" ? 1 : 0

  service_name = var.project_id
  kube_id      = ovh_cloud_project_kube.cluster.id

  client_id  = var.oidc_client_id
  issuer_url = var.oidc_provider_url

  oidc_username_claim  = var.oidc_username_claim
  oidc_username_prefix = var.oidc_username_prefix
  oidc_groups_claim    = var.oidc_groups_claim
  oidc_groups_prefix   = var.oidc_groups_prefix
}
