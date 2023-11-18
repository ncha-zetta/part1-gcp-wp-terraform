provider "google" {
  project = var.gcp_project
  region  = var.region
}

provider "kubernetes" {
  host  = google_container_cluster.gke_cluster.endpoint
  token = data.google_client_config.default.access_token

  cluster_ca_certificate = base64decode(
    google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate,
  )
}
