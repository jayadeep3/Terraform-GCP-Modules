locals {
  access_config = {
    "0" = []
    "1" = [{}]
  }
}
resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  deletion_protection = var.deletion_protection
  tags = var.tags

  boot_disk {
    auto_delete = var.disk_auto_delete
    device_name = var.name
    initialize_params {
      size = var.size
      image = var.image
      labels = var.labels
      type = var.type
    }
  }
  labels = var.labels
  network_interface {
    network = var.compute_network_name
    subnetwork = var.subnet_name
    
  access_config {
      // Ephemeral public IP
    }
  }
  scheduling {
        provisioning_model  = var.provisioning_model
    }

  metadata = var.metadata

  # metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # email  = "terraform-oasys-cybernatics@oasys-cybernetics-dev.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
depends_on = [ var.firewall_name ]
}
