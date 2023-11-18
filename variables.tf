variable "gcp_project" {
  description = "GCP project name"
  default     = "copper-index-405519"
}

variable "region" {
  description = "GCP region"
  default     = "us-east1"
}

variable "tfstate_bucket" {
  description = "TF state bucket name"
  default     = "part1-wp-tfstate"
}