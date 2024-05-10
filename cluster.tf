resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.project_id
  name         = var.cluster_name
  region       = var.region
  version      = var.cluster_version

  private_network_id = tolist(ovh_cloud_project_network_private.net.regions_attributes[*].openstackid)[0]

  depends_on = [ovh_cloud_project_network_private_subnet.subnet]
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  count = length(var.node_pools)

  service_name  = var.project_id
  kube_id       = ovh_cloud_project_kube.cluster.id
  name          = var.node_pools[count.index].name != "" ? var.node_pools[count.index].name : "pool${count.index}"
  flavor_name   = var.node_pools[count.index].flavor_name
  desired_nodes = var.node_pools[count.index].nodes
  max_nodes     = var.node_pools[count.index].nodes
  min_nodes     = var.node_pools[count.index].nodes
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
