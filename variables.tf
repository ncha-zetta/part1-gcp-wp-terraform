variable "gcp_project" {
  description = "GCP project name"
  default     = "copper-index-405519"
}

variable "region" {
  description = "GCP region"
  default     = "us-east1"
}

variable "wordpress_media_bucket_name" {
  description = "GCP bucket name"
  default     = "wordpress-media"
}

variable "db_password" {
  description = "Database password"
}