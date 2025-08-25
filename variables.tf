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

variable "update_policy" {
  description = "How the cluster should perform updates."
  type        = string
  default     = "MINIMAL_DOWNTIME"

  validation {
    condition     = contains(["ALWAYS_UPDATE", "MINIMAL_DOWNTIME", "NEVER_UPDATE"], var.update_policy)
    error_message = "Must be one of: [ALWAYS_UPDATE, MINIMAL_DOWNTIME, NEVER_UPDATE]"
  }
}
variable "node_pools" {
  description = "Node pools to create for the cluster."
  type = list(object({
    flavor_name        = string
    nodes              = number
    min_nodes          = optional(number, 0)
    max_nodes          = optional(number, 0)
    name               = optional(string, "")
    availability_zones = optional(list(string), [])
    monthly_billed     = optional(bool, false)
    template = optional(
      object({
        annotations   = optional(map(any), {})
        labels        = optional(map(any), {})
        finalizers    = optional(list(string), [])
        unschedulable = optional(bool, false)
        taints = optional(list(object({
          effect = string
          key    = string
          value  = string
        })), [])
      }),
      null
    )
  }))
  default = []
}

# Network settings
variable "network_openstack_id" {
  description = "Openstack ID of the private network in which the cluster should be placed."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet in the private network in which nodes should be created."
  type        = string
}

# OIDC settings

variable "oidc_provider_url" {
  description = "URL to use for OIDC authentication. Enables OIDC if specified."
  type        = string
  default     = ""
}

variable "oidc_client_id" {
  description = "OIDC client ID to give the cluster for login."
  type        = string
  default     = ""
}

variable "oidc_username_claim" {
  description = "OIDC Property to use for username."
  type        = string
  default     = ""
}

variable "oidc_username_prefix" {
  description = "Prefix to add to all usernames connecting to the cluster."
  type        = string
  default     = ""
}

variable "oidc_groups_claim" {
  description = "Groups to include in the OIDC claim."
  type        = list(string)
  default     = []
}

variable "oidc_groups_prefix" {
  description = "Prefix to add to all groups connecting to the cluster."
  type        = string
  default     = ""
}
