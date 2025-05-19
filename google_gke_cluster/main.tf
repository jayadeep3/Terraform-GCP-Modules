resource "google_container_cluster" "primary" {
  name     = var.name
  location = var.location
  project  = var.project_id

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {}
}
