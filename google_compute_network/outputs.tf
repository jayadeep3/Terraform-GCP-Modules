output "compute_network_id" {
  value       = google_compute_network.vpc-network.id
  description = "The id of the VPC being created"
}
output "compute_network_name" {
  value       = google_compute_network.vpc-network.name
  description = "The name of the VPC being created"
}
# output "compute_network_self_link" {
#   value       = google_compute_network.vpc-network.network_self_link
#   description = "The URI of the VPC being created"
# }