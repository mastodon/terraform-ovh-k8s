locals {
  network_name = "${var.cluster_name}-vlan"
  gateway_name = "${var.cluster_name}-vlan-gateway"

  subnet_mask  = split("/", var.network_cidr)[1]
  subnet_start = cidrhost(var.network_cidr, 2)
  subnet_end   = cidrhost(var.network_cidr, pow(2, (32 - local.subnet_mask)) - 2)
}

resource "ovh_cloud_project_network_private" "net" {
  service_name = var.project_id
  name         = local.network_name
  regions      = [var.region]
}

resource "ovh_cloud_project_network_private_subnet" "subnet" {
  service_name = var.project_id
  network_id   = ovh_cloud_project_network_private.net.id

  region  = var.region
  start   = local.subnet_start
  end     = local.subnet_end
  network = var.network_cidr
  dhcp    = true

  depends_on = [ovh_cloud_project_network_private.net]
}

resource "ovh_cloud_project_gateway" "gateway" {
  service_name = var.project_id
  name         = local.gateway_name
  model        = var.network_gateway_model
  region       = var.region
  network_id   = ovh_cloud_project_network_private.net.id
  subnet_id    = ovh_cloud_project_network_private_subnet.subnet.id
}
