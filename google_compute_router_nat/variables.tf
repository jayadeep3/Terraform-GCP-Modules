variable "name" {
}

variable "compute_router_name" {
  description = "Name of the cloud router"

}

variable "region" {

}

variable "nat_ip_allocate_option" {
  description = "(Optional) How external IPs should be allocated for this NAT. Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform, or MANUAL_ONLY for only user-allocated NAT IP addresses. Possible values are: MANUAL_ONLY, AUTO_ONLY."

}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "Possible values are: ALL_SUBNETWORKS_ALL_IP_RANGES, ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, LIST_OF_SUBNETWORKS."
}

variable "public_subnet_name" {
  description = "Name of the subnet"
}
