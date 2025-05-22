variable "name" {}
variable "location" {}
variable "project_id" {}
variable "cluster" {}
variable "node_count" { default = 1 }
variable "machine_type" { default = "e2-medium" }
variable "labels" { default = {} }
variable "preemptible" { default = false }
variable "disk_type" {}
variable "disk_size_gb" {}
