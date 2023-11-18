terraform {
  backend "gcs" {
    bucket  = var.tfstate_bucket
    prefix  = "terraform/state"
  }
}
