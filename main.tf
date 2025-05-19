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
}

# Example: Using all modules, passing required variables

module "network" {
  source                  = "./google_compute_network"
  project_id              = var.project_id
  region                  = var.region
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}

module "subnetwork" {
  source                   = "./google_compute_subnetwork"
  project_id               = var.project_id
  region                   = var.region
  compute_network_name     = var.network_name
  name                     = var.subnetwork_name
  subnet_cidr_range        = var.subnet_cidr_range
  private_ip_google_access = var.private_ip_google_access
}

module "firewall" {
  source              = "./google_compute_firewall"
  name                = var.firewall_name
  compute_network_name= var.network_name
  protocol            = var.firewall_protocol
  ports               = var.firewall_ports
  source_ranges       = var.firewall_source_ranges
  target_tags         = var.firewall_target_tags
}

module "router" {
  source                = "./google_compute_router"
  project_id            = var.project_id
  compute_network_name  = var.network_name
  compute_router_name   = var.router_name
  region                = var.region
}

module "router_nat" {
  source                           = "./google_compute_router_nat"
  name                             = var.nat_name
  compute_router_name              = var.router_name
  region                           = var.region
  nat_ip_allocate_option           = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnet_id                        = var.nat_subnet_id
}

module "disk" {
  source  = "./google_compute_disk"
  zone    = var.zone
  name    = var.disk_name
  type    = var.disk_type
  image   = var.disk_image
  labels  = var.disk_labels
  size    = var.disk_size
}

module "attached_disk" {
  source             = "./google_compute_attached_disk"
  disk_id            = var.disk_id
  compute_instance_id= var.compute_instance_id
  instance_zone      = var.zone
}

module "instance_private" {
  source               = "./google_compute_instance_private"
  name                 = var.instance_private_name
  machine_type         = var.instance_private_machine_type
  zone                 = var.zone
  tags                 = var.instance_private_tags
  image                = var.instance_private_image
  labels               = var.instance_private_labels
  metadata             = var.instance_private_metadata
  compute_network_name = var.network_name
  firewall_name        = var.firewall_name
  deletion_protection  = var.instance_private_deletion_protection
  size                 = var.instance_private_disk_size
  type                 = var.instance_private_disk_type
  disk_auto_delete     = var.instance_private_disk_auto_delete
  subnet_name          = var.subnetwork_name
  provisioning_model   = var.instance_private_provisioning_model
}

module "instance_public" {
  source               = "./google_compute_instance_public"
  name                 = var.instance_public_name
  machine_type         = var.instance_public_machine_type
  zone                 = var.zone
  tags                 = var.instance_public_tags
  image                = var.instance_public_image
  labels               = var.instance_public_labels
  metadata             = var.instance_public_metadata
  compute_network_name = var.network_name
  firewall_name        = var.firewall_name
  deletion_protection  = var.instance_public_deletion_protection
  size                 = var.instance_public_disk_size
  type                 = var.instance_public_disk_type
  disk_auto_delete     = var.instance_public_disk_auto_delete
  subnet_name          = var.subnetwork_name
  provisioning_model   = var.instance_public_provisioning_model
}
