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
  default     = "wordpress-media-ncha-zetta"
}

variable "db_password" {
  description = "Database password"
}

variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  default     = "wordpress-cluster"
}

variable "cloud_sql_name" {
  description = "name of db name"
  default     = "wordpress-db"
}