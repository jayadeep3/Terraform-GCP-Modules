variable "project_id" { description = "GCP project ID" }
variable "region"     { description = "GCP region" }
variable "zone"       { description = "GCP zone" }

# Network module
variable "network_name" {}
variable "auto_create_subnetworks" {}
variable "routing_mode" {}

# Subnetwork module
variable "subnetwork_name" {}
variable "subnet_cidr_range" {}
variable "private_ip_google_access" {}

# Firewall module
variable "firewall_name" {}
variable "firewall_protocol" {}
variable "firewall_ports" { type = list(number) }
variable "firewall_source_ranges" {}
variable "firewall_target_tags" {}

# Router module
variable "router_name" {}

# Router NAT module
variable "nat_name" {}
variable "nat_ip_allocate_option" {}
variable "source_subnetwork_ip_ranges_to_nat" {}
variable "nat_subnet_id" {}

# Disk module
variable "disk_name" {}
variable "disk_type" {}
variable "disk_image" {}
variable "disk_labels" {}
variable "disk_size" {}

# Attached Disk module
variable "disk_id" {}
variable "compute_instance_id" {}

# Instance Private module
variable "instance_private_name" {}
variable "instance_private_machine_type" {}
variable "instance_private_tags" {}
variable "instance_private_image" {}
variable "instance_private_labels" {}
variable "instance_private_metadata" {}
variable "instance_private_deletion_protection" {}
variable "instance_private_disk_size" {}
variable "instance_private_disk_type" {}
variable "instance_private_disk_auto_delete" {}
variable "instance_private_provisioning_model" {}

# Instance Public module
variable "instance_public_name" {}
variable "instance_public_machine_type" {}
variable "instance_public_tags" {}
variable "instance_public_image" {}
variable "instance_public_labels" {}
variable "instance_public_metadata" {}
variable "instance_public_deletion_protection" {}
variable "instance_public_disk_size" {}
variable "instance_public_disk_type" {}
variable "instance_public_disk_auto_delete" {}
variable "instance_public_provisioning_model" {}
