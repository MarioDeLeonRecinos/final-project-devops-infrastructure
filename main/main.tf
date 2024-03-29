resource "google_compute_network" "vpc_network" {
  name                    = var.name_vpc
  auto_create_subnetworks = var.auto_create_subnetworks_vpc
  mtu                     = var.mtu_vpc
}

resource "google_compute_firewall" "rules" {
  name        = "my-firewall-rule"
  network     = google_compute_network.vpc_network.name
  description = "Creates firewall rule targeting ip range"

  allow {
    protocol  = "tcp"
  }
  allow {
    protocol  = "udp"
  }
  allow {
    protocol  = "icmp"
  }

  priority = 5000
  source_ranges = ["0.0.0.0/0"]

}

resource "google_compute_firewall" "rulesEgress" {
  name        = "my-firewall-rule-egress"
  network     = google_compute_network.vpc_network.name
  description = "Creates firewall rule targeting ip range"
  direction = "EGRESS"
  allow {
    protocol  = "tcp"
  }
  allow {
    protocol  = "udp"
  }
  allow {
    protocol  = "icmp"
  }

  priority = 5000
  source_ranges = ["0.0.0.0/0"]

}

module "dns-provider" {
  source = "./modules/dns-provider"

  name      = var.name_dns
  dns_name  = var.dns_name
  labels    = var.labels_dns
  subdomain = var.subdomain_dns
}
#test for cloud build testtest
module "kubernetes-provider" {
  source = "./modules/kubernetes-provider"

  name                 = var.name_kubernetes
  name_node_pool       = var.name_node_pool_kubernetes
  service_account_name = var.service_account_name_kubernetes
  machine_type         = var.machine_type_kubernetes
  initial_node_count   = var.initial_node_count_kubernetes
  node_count           = var.node_count_kubernetes
  vpc_network          = google_compute_network.vpc_network.name
  labels               = var.labels_kubernetes
  tags                 = var.tags_kubernetes
}

module "cloud-sql" {
  source = "./modules/cloud-sql"

  name              = var.name_sql
  database_version  = var.database_version_sql
  database_tier     = var.database_tier_sql
  vpc_network       = google_compute_network.vpc_network.id
  user              = var.user_sql
  password          = var.password_sql
  availability_type = var.availability_type_sql
}