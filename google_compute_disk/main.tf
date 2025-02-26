resource "google_compute_disk" "default" {
  name  = var.name
  type  = var.type
  zone  = var.zone
  image = var.image
  labels = var.labels
  #physical_block_size_bytes = var.physical_block_size_bytes
  size = var.size
}
