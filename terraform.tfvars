project_id = "cloud-devops-459104"
region     = "asia-south1"
zone       = "asia-south1-a"

# Network
compute_network_name              = "vpc-network"
auto_create_subnetworks   = false
routing_mode              = "REGIONAL"

# Subnetwork
public_subnet_name        = "public-subnet-1"
private_subnet_name       = "private-subnet-1"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
private_ip_google_access  = true

# Firewall
firewall_name             = "allow-ssh"
protocol         = "tcp"
ports            = [22]
source_ranges    = ["0.0.0.0/0"]
target_tags      = ["ssh"]

# Router
compute_router_name               = "router-1"

# Router NAT
nat_name                        = "nat-1"
nat_ip_allocate_option          = "AUTO_ONLY"
source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
# nat_subnet_id                   = "subnet-1-id"

# Disk
disk_name    = "disk-1"
disk_type    = "pd-standard"
disk_image   = "debian-cloud/debian-11"
disk_labels  = {}
disk_size    = 10

# Attached Disk
# disk_id             = "disk-1-id"
# compute_instance_id = "instance-1-id"

# Instance Private
instance_private_name                = "vm-private"
machine_type                         = "e2-medium"
instance_private_tags                = ["ssh"]
instance_private_image               = "debian-cloud/debian-11"
instance_private_labels              = { "key" = "private"}
metadata                             = {}
deletion_protection                  = false
disk_auto_delete                     = true
provisioning_model                   = "STANDARD"

# Instance Public
instance_public_name                = "vm-public"
instance_public_tags                = ["ssh"]
instance_public_image               = "debian-cloud/debian-11"
instance_public_labels              = { "key" = "public"}

# GKE Cluster
cluster_name      = "my-gke-cluster"

# GKE Nodepool
nodepool_name     = "primary-node-pool"
node_count        = 3
node_labels       = {
  "env" = "dev"
}
preemptible       = false
disk_size_gb = 20
