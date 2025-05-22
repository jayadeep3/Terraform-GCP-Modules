output "network_name" {
  value = module.network.compute_network_name
}
output "public_subnetwork_name" {
  value = module.public_subnet.subnets_name
}
output "private_subnetwork_name" {
  value = module.private_subnet.subnets_name
}
output "firewall_name" {
  value = module.firewall.firewall_name
}
output "router_name" {
  value = module.router.cloud_router_name
}
output "nat_name" {
  value = module.router_nat.router_nat_name
}
output "disk_name" {
  value = module.disk.disk_id
}
output "attached_disk_id" {
  value = module.attached_disk.attached_disk_name
}
output "instance_private_name" {
  value = module.instance_private.compute_instance_id
}
output "instance_public_name" {
  value = module.instance_public.compute_instance_id
}
output "gke_cluster_id" {
  value = module.gke_cluster.cluster_id
}
output "gke_cluster_endpoint" {
  value = module.gke_cluster.endpoint
}
output "gke_cluster_master_version" {
  value = module.gke_cluster.master_version
}
output "gke_nodepool_id" {
  value = module.gke_nodepool.nodepool_id
}
output "gke_nodepool_instance_group_urls" {
  value = module.gke_nodepool.instance_group_urls
}
