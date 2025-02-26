resource "google_compute_firewall" "firewall" {
  name    = var.name
  network = var.compute_network_name
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
 
  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}
