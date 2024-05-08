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

output "network_id" {
  description = "ID of the private network created for the cluster."
  value       = ovh_cloud_project_network_private.net.id
}

output "network_name" {
  description = "Name of the private network created for the cluster."
  value       = ovh_cloud_project_network_private.net.name
}

output "vlan_id" {
  description = "VLAN ID of the private network created for the cluster."
  value       = ovh_cloud_project_network_private.net.vlan_id
}

output "openstackID" {
  value = one(ovh_cloud_project_network_private.net.regions_attributes[*].openstackid)
}
