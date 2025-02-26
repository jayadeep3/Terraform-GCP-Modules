output "subnets_name" {
  value       = google_compute_subnetwork.subnet.name
  description = "The names of the subnets being created"
}
output "subnets_id" {
  value       = google_compute_subnetwork.subnet.id
  description = "The names of the subnets being created"
}
output "subnets_ip_cidr_range" {
  value       = google_compute_subnetwork.subnet.ip_cidr_range
  description = "The names of the subnets being created"
}
