output "subnets_name" {
  value       = google_compute_subnetwork.private.name
  description = "The names of the private subnets being created"
}
output "subnets_id" {
  value       = google_compute_subnetwork.private.id
  description = "The names of the private subnets being created"
}
output "subnets_ip_cidr_range" {
  value       = google_compute_subnetwork.private.ip_cidr_range
  description = "The names of the private subnets being created"
}
