output "nodepool_id" {
  value = google_container_node_pool.default.id
}
output "instance_group_urls" {
  value = google_container_node_pool.default.instance_group_urls
}
