variable "project_id" {
  description = "The GCP project ID"
  type        = string
}
variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}
# Add other variables needed by your modules, for example:
# variable "network_name" { ... }
