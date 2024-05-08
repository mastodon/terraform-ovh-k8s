resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.project_id
  name         = var.cluster_name
  region       = var.region
  version      = var.cluster_version

  private_network_id = ovh_cloud_project_network_private.net.id
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  count = length(var.node_pools)

  service_name  = var.project_id
  kube_id       = ovh_cloud_project_kube.cluster.id
  name          = "nodepool${count.index}"
  flavor_name   = var.node_pools[count.index].flavor_name
  desired_nodes = var.node_pools[count.index].nodes
  max_nodes     = var.node_pools[count.index].nodes
  min_nodes     = var.node_pools[count.index].nodes
}
