terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

# Provider setup (example)
provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("cloud-devops-459104-1c7af73794dd.json")
}

# Example: Using all modules, passing required variables

module "network" {
  source                  = "./google_compute_network"
  project_id              = var.project_id
  region                  = var.region
  name                    = var.compute_network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}

# module "subnetwork" {
#  source                   = "./google_compute_subnetwork"
#  project_id               = var.project_id
#  region                   = var.region
#  compute_network_name     = var.network_name
#  name                     = var.subnetwork_name
#  subnet_cidr_range        = var.subnet_cidr_range
#  private_ip_google_access = var.private_ip_google_access
#}

# Private Subnet (no public IPs, attached to NAT and Cloud Router)
module "private_subnet" {
  source                    = "./google_compute_private_subnetwork"
  project_id                = var.project_id
  name                      = var.private_subnet_name
  private_subnet_cidr_range = var.private_subnet_cidr
  region                    = var.region
  compute_network_name      = module.network.compute_network_name
  private_ip_google_access  = true
  depends_on = [ module.network ]
}

# Public Subnet (can have public IPs)
module "public_subnet" {
  source                    = "./google_compute_public_subnetwork"
  project_id                = var.project_id
  name                      = var.public_subnet_name
  public_subnet_cidr_range  = var.public_subnet_cidr
  region                    = var.region
  compute_network_name      = module.network.compute_network_name
  private_ip_google_access  = false
  depends_on = [ module.private_subnet ]
}

module "firewall" {
  source              = "./google_compute_firewall"
  name                = var.firewall_name
  compute_network_name= var.compute_network_name
  protocol            = var.protocol
  ports               = var.ports
  source_ranges       = var.source_ranges
  target_tags         = var.target_tags
  depends_on = [ module.public_subnet ]
}

module "router" {
  source                = "./google_compute_router"
  project_id            = var.project_id
  compute_network_name  = var.compute_network_name
  compute_router_name   = var.compute_router_name
  region                = var.region
  depends_on = [ module.firewall ]
}

module "router_nat" {
  source                           = "./google_compute_router_nat"
  name                             = var.nat_name
  compute_router_name              = module.router.cloud_router_name
  region                           = var.region
  nat_ip_allocate_option           = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  public_subnet_name               = module.public_subnet.subnets_name
  depends_on = [ module.router ]
}

module "disk" {
  source  = "./google_compute_disk"
  zone    = var.zone
  name    = var.disk_name
  type    = var.disk_type
  image   = var.disk_image
  labels  = var.disk_labels
  size    = var.disk_size
  depends_on = [ module.router_nat ]
}

module "attached_disk" {
  source             = "./google_compute_attached_disk"
  disk_id            = module.disk.disk_id
  compute_instance_id= module.instance_private.compute_instance_id
  instance_zone      = var.zone
  depends_on = [ module.instance_private ]
}

module "instance_private" {
  source               = "./google_compute_instance_private"
  name                 = var.instance_private_name
  machine_type         = var.machine_type
  zone                 = var.zone
  tags                 = var.instance_private_tags
  image                = var.instance_private_image
  labels               = var.instance_private_labels
  metadata             = var.metadata
  compute_network_name = var.compute_network_name
  firewall_name        = var.firewall_name
  deletion_protection  = var.deletion_protection
  size                 = var.disk_size
  type                 = var.disk_type
  disk_auto_delete     = var.disk_auto_delete
  subnet_name          = var.public_subnet_name
  provisioning_model   = var.provisioning_model
  depends_on = [ module.disk ]
}

module "instance_public" {
  source               = "./google_compute_instance_public"
  name                 = var.instance_public_name
  machine_type         = var.machine_type
  zone                 = var.zone
  tags                 = var.instance_public_tags
  image                = var.instance_public_image
  labels               = var.instance_public_labels
  metadata             = var.metadata
  compute_network_name = var.compute_network_name
  firewall_name        = var.firewall_name
  deletion_protection  = var.deletion_protection
  size                 = var.disk_size
  type                 = var.disk_type
  disk_auto_delete     = var.disk_auto_delete
  subnet_name          = var.private_subnet_name
  provisioning_model   = var.provisioning_model
  depends_on = [ module.instance_private ]
}

module "gke_cluster" {
  source    = "./google_gke_cluster"
  name      = var.cluster_name
  location  = var.region
  project_id = var.project_id
  network   = var.compute_network_name
  subnetwork = var.private_subnet_name
  depends_on = [ module.instance_public ]
}

module "gke_nodepool" {
  source      = "./google_gke_nodepool"
  name        = var.nodepool_name
  location    = var.region
  project_id  = var.project_id
  cluster     = module.gke_cluster.cluster_id
  node_count  = var.node_count
  machine_type = var.machine_type
  labels      = var.node_labels
  preemptible = var.preemptible
  disk_type = var.disk_type
  disk_size_gb = var.disk_size_gb
  depends_on = [ module.gke_cluster ]
}
