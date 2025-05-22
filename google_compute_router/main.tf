resource "google_compute_router" "router" {
  project    = var.project_id
  name       = var.compute_router_name
  network    = var.compute_network_name
  region     = var.region
  # depends_on = [google_compute_network.vpc-network]
}
