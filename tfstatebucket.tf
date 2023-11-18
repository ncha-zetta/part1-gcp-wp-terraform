provider "google" {
  project = var.gcp_project
  region  = var.region
}

resource "google_storage_bucket" "terraform_state" {
  name          = var.tfstate_bucket
  location      = var.region

  versioning {
    enabled = true
  }
}
