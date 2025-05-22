output "subnets_name" {
  value       = google_compute_subnetwork.public.name
  description = "The names of the public subnets being created"
}
output "subnets_id" {
  value       = google_compute_subnetwork.public.id
  description = "The names of the public subnets being created"
}

output "subnets_ip_cidr_range" {
  value       = google_compute_subnetwork.public.ip_cidr_range
  description = "The names of the public subnets being created"
}
