terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  # credentials = file("<YOUR-CREDENTIALS-FILE>.json") # if needed
}

module "network" {
  source = "./google_compute_network"
  # Add required variables here, e.g.:
  # name = var.network_name
}

module "subnetwork" {
  source = "./google_compute_subnetwork"
  # Add required variables here
}

module "firewall" {
  source = "./google_compute_firewall"
  # Add required variables here
}

module "router" {
  source = "./google_compute_router"
  # Add required variables here
}

module "router_nat" {
  source = "./google_compute_router_nat"
  # Add required variables here
}

module "disk" {
  source = "./google_compute_disk"
  # Add required variables here
}

module "attached_disk" {
  source = "./google_compute_attached_disk"
  # Add required variables here
}

module "instance_private" {
  source = "./google_compute_instance_private"
  # Add required variables here
}

module "instance_public" {
  source = "./google_compute_instance_public"
  # Add required variables here
}
