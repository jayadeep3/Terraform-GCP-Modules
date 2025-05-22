#resource "google_container_node_pool" "default" {
#  name       = var.name
#  location   = var.location
#  cluster    = var.cluster
#  project    = var.project_id

#  node_count = var.node_count

#  node_config {
#    machine_type = var.machine_type
#    labels       = var.labels
#    preemptible  = var.preemptible
#    disk_type    = var.disk_type        # Add this line
#    disk_size_gb = var.disk_size_gb                   # Or set lower size like 50 GB
#    oauth_scopes = [
#      "https://www.googleapis.com/auth/cloud-platform",
#    ]
#  }
#}
