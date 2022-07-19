## DNS VARIABLES
variable "name_dns" {
  description = "Name of the resource"
  type        = string
  default     = "production"
}

variable "dns_name" {
  description = "Name of the dns used. Must be unique."
  type        = string
  default     = "fpproduction.tk."
}

variable "labels_dns" {
  description = "Labels to set."
  type        = map(string)
  default = {
    creator = "mario",
    owner   = "mario"
  }
}

variable "subdomain_dns" {
  description = "Subdomains to set."
  type        = set(string)
  default     = ["monitor", "argo", "vault", "nosql"]
}

## SQL VARIABLES
variable "name_sql" {
  description = "Name of the resource"
  type        = string
  default     = "my-sql-db-prod"
}

variable "database_version_sql" {
  description = "Database version to set."
  type        = string
  default     = "MYSQL_8_0"
}

variable "database_tier_sql" {
  description = "Database Tier to set."
  type        = string
  default     = "db-g1-small"
}

variable "user_sql" {
  description = "Name for user."
  type        = string
  default     = "wp-user"
}

variable "password_sql" {
  description = "Password for user."
  type        = string
  default     = "wp-password"
}

variable "availability_type_sql" {
  description = "availability_type."
  type        = string
  default     = "REGIONAL"
}

## KUBERNETES VARIABLES
variable "name_kubernetes" {
  description = "Name of the cluster"
  type        = string
  default     = "my-gke-cluster"
}

variable "name_node_pool_kubernetes" {
  description = "Name of the node pool"
  type        = string
  default     = "my-node-pool"
}

variable "node_count_kubernetes" {
  description = "Number of nodes"
  type        = number
  default     = 5
}

variable "initial_node_count_kubernetes" {
  description = "Number of nodes at start"
  type        = number
  default     = 1
}

variable "service_account_name_kubernetes" {
  description = "Name of the resource"
  type        = string
  default     = "service-account-id"
}

variable "machine_type_kubernetes" {
  description = "Name of the machine type"
  type        = string
  default     = "e2-highcpu-8"
}

variable "labels_kubernetes" {
  description = "Labels to set."
  type        = map(string)
  default = {
    creator = "mario",
    owner   = "mario"
  }
}

variable "tags_kubernetes" {
  description = "tags to set."
  type        = set(string)
  default     = ["creator", "owner", "mario"]
}

## VPC VARIABLES
variable "name_vpc" {
  description = "Name of the vpc network"
  type        = string
  default     = "vpc-network"
}

variable "auto_create_subnetworks_vpc" {
  description = "Value of the auto create subnetworks"
  type        = bool
  default     = true
}

variable "mtu_vpc" {
  description = "MTU of the vpc"
  type        = number
  default     = 1460
}