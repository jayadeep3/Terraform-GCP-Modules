output "network_name" {
  value = module.network.name
}
output "subnetwork_name" {
  value = module.subnetwork.name
}
output "firewall_name" {
  value = module.firewall.name
}
output "router_name" {
  value = module.router.name
}
output "nat_name" {
  value = module.router_nat.name
}
output "disk_name" {
  value = module.disk.name
}
output "attached_disk_id" {
  value = module.attached_disk.disk_id
}
output "instance_private_name" {
  value = module.instance_private.name
}
output "instance_public_name" {
  value = module.instance_public.name
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
