project_id = "your-gcp-project-id"
region     = "us-central1"
zone       = "us-central1-a"

# Network
network_name              = "vpc-network"
auto_create_subnetworks   = false
routing_mode              = "REGIONAL"

# Subnetwork
subnetwork_name           = "subnet-1"
subnet_cidr_range         = "10.0.1.0/24"
private_ip_google_access  = true

# Firewall
firewall_name             = "allow-ssh"
firewall_protocol         = ["tcp"]
firewall_ports            = [22]
firewall_source_ranges    = ["0.0.0.0/0"]
firewall_target_tags      = ["ssh"]

# Router
router_name               = "router-1"

# Router NAT
nat_name                        = "nat-1"
nat_ip_allocate_option          = "AUTO_ONLY"
source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
nat_subnet_id                   = "subnet-1-id"

# Disk
disk_name    = "disk-1"
disk_type    = "pd-standard"
disk_image   = "debian-cloud/debian-11"
disk_labels  = {}
disk_size    = 10

# Attached Disk
disk_id             = "disk-1-id"
compute_instance_id = "instance-1-id"

# Instance Private
instance_private_name                = "vm-private"
instance_private_machine_type        = "e2-medium"
instance_private_tags                = ["private"]
instance_private_image               = "debian-cloud/debian-11"
instance_private_labels              = {}
instance_private_metadata            = {}
instance_private_deletion_protection = false
instance_private_disk_size           = 10
instance_private_disk_type           = "pd-balanced"
instance_private_disk_auto_delete    = true
instance_private_provisioning_model  = "STANDARD"

# Instance Public
instance_public_name                = "vm-public"
instance_public_machine_type        = "e2-medium"
instance_public_tags                = ["public"]
instance_public_image               = "debian-cloud/debian-11"
instance_public_labels              = {}
instance_public_metadata            = {}
instance_public_deletion_protection = false
instance_public_disk_size           = 10
instance_public_disk_type           = "pd-balanced"
instance_public_disk_auto_delete    = true
instance_public_provisioning_model  = "STANDARD"
