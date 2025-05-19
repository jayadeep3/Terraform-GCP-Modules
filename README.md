# Terraform GCP Modules

This repository contains reusable Terraform modules for Google Cloud Platform (GCP) resources, including Compute, Networking, and Kubernetes Engine (GKE).

## Modules

- `google_compute_attached_disk`
- `google_compute_disk`
- `google_compute_firewall`
- `google_compute_instance_private`
- `google_compute_instance_public`
- `google_compute_network`
- `google_compute_router`
- `google_compute_router_nat`
- `google_compute_subnetwork`
- `google_gke_cluster`
- `google_gke_nodepool`

---

### 1. google_compute_attached_disk

Reusable module for attaching a disk to a Compute Engine instance.

**Usage:**
```hcl
module "attached_disk" {
  source              = "./google_compute_attached_disk"
  disk_id             = var.disk_id
  compute_instance_id = var.compute_instance_id
  instance_zone       = var.instance_zone
}
```

**Inputs:**
- `disk_id` (string): ID of the disk to attach
- `compute_instance_id` (string): ID of the instance to attach to
- `instance_zone` (string): Zone of the instance

**Outputs:**
- (add any outputs if available)

---

### 2. google_compute_disk

Reusable module for creating a Compute Engine disk.

**Usage:**
```hcl
module "compute_disk" {
  source   = "./google_compute_disk"
  name     = var.name
  type     = var.type
  zone     = var.zone
  image    = var.image
  size     = var.size
  labels   = var.labels
}
```

**Inputs:**
- `name` (string): Name of the disk
- `type` (string): Disk type (e.g., pd-standard)
- `zone` (string): Zone for the disk
- `image` (string): Image to create the disk from
- `size` (number): Size in GB
- `labels` (map): Labels for the disk

**Outputs:**
- (add any outputs if available)

---

### 3. google_compute_firewall

Reusable module for creating a firewall rule.

**Usage:**
```hcl
module "firewall" {
  source                = "./google_compute_firewall"
  name                  = var.name
  compute_network_name  = var.compute_network_name
  protocol              = var.protocol
  ports                 = var.ports
  source_ranges         = var.source_ranges
  target_tags           = var.target_tags
}
```

**Inputs:**
- `name` (string): Firewall rule name
- `compute_network_name` (string): Network name
- `protocol` (string): Protocol (e.g., tcp)
- `ports` (list): List of allowed ports
- `source_ranges` (list): List of source ranges
- `target_tags` (list): List of target tags

**Outputs:**
- (add any outputs if available)

---

### 4. google_compute_instance_private

Reusable module for creating a private Compute Engine instance.

**Usage:**
```hcl
module "private_instance" {
  source               = "./google_compute_instance_private"
  name                 = var.name
  machine_type         = var.machine_type
  zone                 = var.zone
  deletion_protection  = var.deletion_protection
  tags                 = var.tags
  disk_auto_delete     = var.disk_auto_delete
  size                 = var.size
  image                = var.image
  type                 = var.type
  labels               = var.labels
  compute_network_name = var.compute_network_name
  subnet_name          = var.subnet_name
  provisioning_model   = var.provisioning_model
  metadata             = var.metadata
  firewall_name        = var.firewall_name
  service_account_email = var.service_account_email
}
```

**Inputs:**
- `name` (string): Instance name
- `machine_type` (string): Machine type
- `zone` (string): Zone
- `deletion_protection` (bool): Enable deletion protection
- `tags` (list): Network tags
- `disk_auto_delete` (bool): Auto-delete boot disk
- `size` (number): Disk size
- `image` (string): Disk image
- `type` (string): Disk type
- `labels` (map): Labels
- `compute_network_name` (string): Network to attach
- `subnet_name` (string): Subnet to attach
- `provisioning_model` (string): Provisioning model
- `metadata` (map): Metadata
- `firewall_name` (string): Firewall rule
- `service_account_email` (string): Service account email

**Outputs:**
- (add any outputs if available)

---

### 5. google_compute_instance_public

Reusable module for creating a public Compute Engine instance.

**Usage:**
```hcl
module "public_instance" {
  source               = "./google_compute_instance_public"
  (same variables as private, plus any public-specific ones)
}
```

**Inputs:**
- (copy from private, add any public-specific ones)

**Outputs:**
- (add any outputs if available)

---

### 6. google_compute_network

Reusable module for creating a VPC network.

**Usage:**
```hcl
module "network" {
  source                  = "./google_compute_network"
  project_id              = var.project_id
  name                    = var.name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}
```

**Inputs:**
- `project_id` (string)
- `name` (string)
- `auto_create_subnetworks` (bool)
- `routing_mode` (string)

**Outputs:**
- (add any outputs if available)

---

### 7. google_compute_router

Reusable module for creating a Cloud Router.

**Usage:**
```hcl
module "router" {
  source                = "./google_compute_router"
  project_id            = var.project_id
  compute_router_name   = var.compute_router_name
  compute_network_name  = var.compute_network_name
  region                = var.region
  compute_network       = var.compute_network
}
```

**Inputs:**
- `project_id` (string)
- `compute_router_name` (string)
- `compute_network_name` (string)
- `region` (string)
- `compute_network` (string)

**Outputs:**
- (add any outputs if available)

---

### 8. google_compute_router_nat

Reusable module for creating a Cloud NAT attached to a router.

**Usage:**
```hcl
module "router_nat" {
  source                           = "./google_compute_router_nat"
  name                             = var.name
  compute_router_name              = var.compute_router_name
  region                           = var.region
  nat_ip_allocate_option           = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat
  subnet_id                        = var.subnet_id
}
```

**Inputs:**
- `name` (string)
- `compute_router_name` (string)
- `region` (string)
- `nat_ip_allocate_option` (string)
- `source_subnetwork_ip_ranges_to_nat` (string)
- `subnet_id` (string)

**Outputs:**
- (add any outputs if available)

---

### 9. google_compute_subnetwork

Reusable module for creating a subnet.

**Usage:**
```hcl
module "subnetwork" {
  source                    = "./google_compute_subnetwork"
  project_id                = var.project_id
  name                      = var.name
  subnet_cidr_range         = var.subnet_cidr_range
  region                    = var.region
  compute_network_name      = var.compute_network_name
  private_ip_google_access  = var.private_ip_google_access
  compute_network           = var.compute_network
}
```

**Inputs:**
- `project_id` (string)
- `name` (string)
- `subnet_cidr_range` (string)
- `region` (string)
- `compute_network_name` (string)
- `private_ip_google_access` (bool)
- `compute_network` (string)

**Outputs:**
- (add any outputs if available)

---

### 10. google_gke_cluster

Reusable module for creating a GKE cluster.

**Usage:**
```hcl
module "gke_cluster" {
  source     = "./google_gke_cluster"
  name       = var.cluster_name
  location   = var.region
  project_id = var.project_id
  network    = var.network
  subnetwork = var.subnetwork
}
```

**Inputs:**
- `name` (string): Cluster name
- `location` (string): GCP region or zone
- `project_id` (string): GCP project ID
- `network` (string): VPC network name
- `subnetwork` (string): Subnetwork name

**Outputs:**
- `cluster_id`
- `endpoint`
- `master_version`

---

### 11. google_gke_nodepool

Reusable module for creating a GKE node pool.

**Usage:**
```hcl
module "gke_nodepool" {
  source       = "./google_gke_nodepool"
  name         = var.nodepool_name
  location     = var.region
  project_id   = var.project_id
  cluster      = module.gke_cluster.cluster_id
  node_count   = var.node_count
  machine_type = var.machine_type
  labels       = var.node_labels
  preemptible  = var.preemptible
}
```

**Inputs:**
- `name` (string): Node pool name
- `location` (string): Region or zone
- `project_id` (string): GCP project ID
- `cluster` (string): GKE cluster id (from google_gke_cluster)
- `node_count` (number): Number of nodes
- `machine_type` (string): Machine type for nodes
- `labels` (map): Node labels
- `preemptible` (bool): Use preemptible VMs

**Outputs:**
- `nodepool_id`
- `instance_group_urls`

---

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [Google Cloud Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)

## Inputs & Outputs

Each module provides its own set of input variables and outputs. Refer to the `variables.tf` and `outputs.tf` in each module directory for details.

## License

This repository is licensed under the MIT License.
