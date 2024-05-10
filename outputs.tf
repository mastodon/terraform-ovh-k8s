output "id" {
  description = "The ID of the cluster"
  value       = ovh_cloud_project_kube.cluster.id
}

output "name" {
  description = "Name of the cluster"
  value       = ovh_cloud_project_kube.cluster.name
}

output "nodes_url" {
  description = "URLs of the nodes attached to the cluster"
  value       = ovh_cloud_project_kube.cluster.nodes_url
}

output "kubeconfig" {
  description = "kubeconfig to use when connecting to the cluster"
  value       = ovh_cloud_project_kube.cluster.kubeconfig
}
