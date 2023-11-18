provider "google" {
  project = var.gcp_project
  region  = var.region
}

resource "google_container_cluster" "gke_cluster" {
  name     = "wordpress-cluster"
  location = var.region

  node_pool {
    name       = "wordpress-pool"
    node_count = 3

    node_config {
      machine_type = "e2-medium"
    }
  }
}

