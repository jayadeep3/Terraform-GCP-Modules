variable "project_id" {
  description = "ID of the project"
}
variable "region" {
  description = "Name of the region"
}
variable "name" {
  description = "Name of the resource"
}
variable "auto_create_subnetworks" {
  description = "(Optional) When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
}
variable "routing_mode" {
  description = "The network-wide routing mode to use. Possible values are: REGIONAL, GLOBAL"
}
