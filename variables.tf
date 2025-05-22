# Global/GCP project settings
variable "project_id" {
  description = "GCP project ID"
  type        = string
}
variable "region" {
  description = "Region for resources"
  type        = string
}

# Network
# variable "network" {
#   description = "VPC network name"
#   type        = string
# }
#variable "subnetwork" {
#  description = "Subnetwork name"
#  type        = string
#}
variable "public_subnet_name" {
  description = "Public subnet name"
  type = string 
}

variable "private_subnet_name" {
  description = "Private Subnet name"
  type = string 
}

variable "auto_create_subnetworks" {
  description = "Auto create subnetworks"
  type        = bool
}
variable "routing_mode" {
  description = "Routing mode"
  type        = string
}

# Subnetwork
#variable "subnet_cidr_range" {
#  description = "CIDR range for subnet"
#  type        = string
#}
variable "public_subnet_cidr" {
  description = "CIDR range for Public subnet"
  type = string 
}
variable "private_subnet_cidr" {
  description = "CIDR range for private subnet"  
  type = string
}
variable "private_ip_google_access" {
  description = "Enable private Google access"
  type        = bool
}

# Compute Network/Firewall
variable "compute_network_name" {
  description = "Compute network name"
  type        = string
}
variable "protocol" {
  description = "Firewall protocol"
  type        = string
}
variable "ports" {
  description = "List of allowed ports"
  type        = list(string)
}
variable "source_ranges" {
  description = "Source ranges for firewall"
  type        = list(string)
}
variable "target_tags" {
  description = "Target tags for firewall"
  type        = list(string)
}

# Compute disk
variable "disk_name" {
  description = "Name (for disk, instances, etc.)"
  type        = string
}
variable "disk_type" {
  description = "Disk type"
  type        = string
}
variable "zone" {
  description = "Zone for resources"
  type        = string
}
variable "disk_image" {
  description = "Image for disk or instance"
  type        = string
}
variable "disk_size" {
  description = "Size of the disk"
  type        = number
}
variable "disk_labels" {
  description = "Labels for resources"
  type        = map(string)
}

# Compute Instance (private/public)
variable "machine_type" {
  description = "Machine type"
  type        = string
}
variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}
# variable "tags" {
#   description = "Tags for instance"
#   type        = list(string)
# }
variable "disk_auto_delete" {
  description = "Auto-delete boot disk"
  type        = bool
}
variable "provisioning_model" {
  description = "Provisioning model"
  type        = string
}
variable "instance_private_name" {
  description = "Private Instance name"
  type = string
}
variable "instance_private_image" {
  description = "Private instance for machine image"
  type = string
}
variable "instance_private_labels" {
  description = "Private Instance for labels"
  type = map(string)
}
variable "instance_public_name" {
  description = "Public Instance name"
  type = string
}
variable "instance_public_image" {
  description = "Public instance for machine image"
  type = string
}
variable "instance_public_labels" {
  description = "Public Instance for labels"
  type = map(string)
}
variable "instance_private_tags" {
  description = "Tags for private instance"
  type        = list(string)
}
variable "instance_public_tags" {
  description = "Tags for public instance"
  type        = list(string)
}
variable "metadata" {
  description = "Metadata for instance"
  type        = map(string)
}
variable "firewall_name" {
  description = "Firewall rule name"
  type        = string
}
# variable "service_account_email" {
#   description = "Service account email"
#   type        = string
# }
# variable "subnet_name" {
#   description = "Subnet name"
#   type        = string
# }

# Attached Disk
# variable "disk_id" {
#   description = "Disk ID to attach"
#   type        = string
# }
# variable "compute_instance_id" {
#   description = "Compute instance ID for disk attachment"
#   type        = map(set(string))
# }
# variable "instance_zone" {
#   description = "Zone of the instance for disk attachment"
#   type        = string
# }

# Router
variable "compute_router_name" {
  description = "Router name"
  type        = string
}

# Router NAT
variable "nat_ip_allocate_option" {
  description = "NAT IP allocation option"
  type        = string
}
variable "source_subnetwork_ip_ranges_to_nat" {
  description = "Source subnetwork IP ranges to NAT"
  type        = string
}
# variable "subnet_id" {
#   description = "Subnet ID for NAT"
#   type        = string
# }

variable "nat_name" {
  description = "NAT Name"
  type = string
}

# GKE Cluster
#variable "cluster_name" {
#  description = "GKE cluster name"
#  type        = string
#}

# GKE Nodepool
#variable "nodepool_name" {
#  description = "Node pool name"
#  type        = string
#}
#variable "node_count" {
#  description = "Number of nodes in node pool"
#  type        = number
#}
#variable "node_labels" {
#  description = "Labels for GKE node pool"
#  type        = map(string)
#}
#variable "preemptible" {
#  description = "Use preemptible VMs"
#  type        = bool
#}
#variable "disk_size_gb" {
#  description = "Size of the disk for gke nodes"
#  type = number
#}
