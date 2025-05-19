# Terraform GCP Modules

This repository contains reusable Terraform modules for Google Cloud Platform (GCP) resources, including Compute, Networking, and Kubernetes Engine (GKE).

## Repository Structure

```
.
├── google_compute_attached_disk/
├── google_compute_disk/
├── google_compute_firewall/
├── google_compute_instance_private/
├── google_compute_instance_public/
├── google_compute_network/
├── google_compute_router/
├── google_compute_router_nat/
├── google_compute_subnetwork/
├── google_gke_cluster/
├── google_gke_nodepool/
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## GKE Cluster and Node Pool Modules

### google_gke_cluster

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

### google_gke_nodepool

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

## Root Module Example

```hcl
provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke_cluster" {
  source     = "./google_gke_cluster"
  name       = var.cluster_name
  location   = var.region
  project_id = var.project_id
  network    = var.network
  subnetwork = var.subnetwork
}

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

## Other Modules

You can use the other modules (compute, network, etc.) in a similar way. See each module’s directory for details.

## Requirements

- Terraform >= 1.0.0
- Google Cloud Provider

## License

MIT
