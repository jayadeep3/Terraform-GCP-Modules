terraform {
  backend "gcs" {
    bucket  = "terraform-state-bucket-03"
  }
}
