resource "google_compute_router_nat" "nat" {
  name                               = var.name
  router                             = var.compute_router_name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  subnetwork {
    name                    = var.public_subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  # depends_on = [google_compute_network.vpc-network]
}
