output "cluster_id" {
  value = google_container_cluster.primary.id
}
output "endpoint" {
  value = google_container_cluster.primary.endpoint
}
output "master_version" {
  value = google_container_cluster.primary.master_version
}
