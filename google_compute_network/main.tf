resource "google_compute_network" "vpc-network" {
  project                 = var.project_id
  name                    = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}
