variable "project_id" {
  description = "The ID of the Public Cloud project the resources will be created in."
  type        = string
}

variable "region" {
  description = "Region in which to create the various resources."
  type        = string
  default     = "DE1"
}

# Cluster settings

variable "cluster_name" {
  description = "Name of the cluster to create."
  type        = string
}

variable "cluster_version" {
  description = "Kubelet version to use when creating the cluster."
  type        = string
}

variable "node_pools" {
  description = "Node pools to create for the cluster."
  type = list(object({
    flavor_name = string
    nodes       = number
    template    = optional(map(any), {})
  }))
}

# Network settings

variable "network_cidr" {
  description = "Subnet to assign to the private network."
  type        = string
}

variable "network_gateway_model" {
  description = "Size of the gateway to use for the private network."
  type        = string
  default     = "s"

  validation {
    condition     = contains(["s", "m", "l"], var.network_gateway_model)
    error_message = "Valid values for network_gateway_model are (s, m, l)"
  }
}
