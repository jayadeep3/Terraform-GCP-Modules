resource "google_compute_attached_disk" "default" {
  disk     = var.disk_id
  instance = var.compute_instance_id
  zone = var.instance_zone
}
