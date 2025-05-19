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

## Usage

Each module is located in its own directory. Below are examples of how to use each module in your Terraform configuration.

### 1. google_compute_attached_disk

```hcl
module "attached_disk" {
  source           = "./google_compute_attached_disk"
  disk_id          = "your-disk-id"
  compute_instance_id = "your-instance-id"
  instance_zone    = "us-central1-a"
}
```

### 2. google_compute_disk

```hcl
module "compute_disk" {
  source   = "./google_compute_disk"
  name     = "my-disk"
  type     = "pd-standard"
  zone     = "us-central1-a"
  image    = "debian-11-bullseye-v20220118"
  size     = 100
  labels   = {}
}
```

### 3. google_compute_firewall

```hcl
module "firewall" {
  source             = "./google_compute_firewall"
  name               = "allow-http"
  compute_network_name = "my-network"
  protocol           = "tcp"
  ports              = ["80"]
  source_ranges      = ["0.0.0.0/0"]
  target_tags        = ["http-server"]
}
```

### 4. google_compute_instance_private

```hcl
module "private_instance" {
  source               = "./google_compute_instance_private"
  name                 = "private-vm"
  machine_type         = "e2-medium"
  zone                 = "us-central1-a"
  deletion_protection  = false
  tags                 = ["private"]
  disk_auto_delete     = true
  size                 = 100
  image                = "debian-11"
  type                 = "pd-standard"
  labels               = {}
  compute_network_name = "my-network"
  subnet_name          = "my-subnet"
  provisioning_model   = "STANDARD"
  metadata             = {}
  firewall_name        = "allow-internal"
  service_account_email = "your-service-account@project.iam.gserviceaccount.com"
}
```

### 5. google_compute_instance_public

```hcl
module "public_instance" {
  source               = "./google_compute_instance_public"
  name                 = "public-vm"
  machine_type         = "e2-medium"
  zone                 = "us-central1-a"
  deletion_protection  = false
  tags                 = ["public"]
  disk_auto_delete     = true
  size                 = 100
  image                = "debian-11"
  type                 = "pd-standard"
  labels               = {}
  compute_network_name = "my-network"
  subnet_name          = "my-subnet"
  provisioning_model   = "STANDARD"
  metadata             = {}
  firewall_name        = "allow-http"
  service_account_email = "your-service-account@project.iam.gserviceaccount.com"
}
```

### 6. google_compute_network

```hcl
module "network" {
  source                  = "./google_compute_network"
  project_id              = "your-gcp-project-id"
  name                    = "my-network"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}
```

### 7. google_compute_router

```hcl
module "router" {
  source                = "./google_compute_router"
  project_id            = "your-gcp-project-id"
  compute_router_name   = "my-router"
  compute_network_name  = "my-network"
  region                = "us-central1"
  compute_network       = module.network.network_self_link
}
```

### 8. google_compute_router_nat

```hcl
module "router_nat" {
  source                           = "./google_compute_router_nat"
  name                             = "my-nat"
  compute_router_name              = "my-router"
  region                           = "us-central1"
  nat_ip_allocate_option           = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  subnet_id                        = "my-subnet"
}
```

### 9. google_compute_subnetwork

```hcl
module "subnetwork" {
  source                    = "./google_compute_subnetwork"
  project_id                = "your-gcp-project-id"
  name                      = "my-subnet"
  subnet_cidr_range         = "10.0.1.0/24"
  region                    = "us-central1"
  compute_network_name      = "my-network"
  private_ip_google_access  = true
  compute_network           = module.network.network_self_link
}
```

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
- `cluster` (string): GKE cluster id (from `google_gke_cluster`)
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
