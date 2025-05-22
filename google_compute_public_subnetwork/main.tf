resource "google_compute_subnetwork" "public" {
  project                  = var.project_id
  name                     = var.name
  ip_cidr_range            = var.public_subnet_cidr_range
  region                   = var.region
  network                  = var.compute_network_name
  private_ip_google_access = var.private_ip_google_access
}
