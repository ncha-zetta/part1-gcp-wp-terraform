variable "gcp_project" {
  description = "copper-index-405519"
}

variable "region" {
  description = "GCP region"
  default     = "europe-central2"
}

variable "tfstate_bucket" {
  description = "TF state bucket name"
  default     = "part1-wp-tfstate"
}