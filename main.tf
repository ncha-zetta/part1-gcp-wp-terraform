provider "google" {
  project = var.gcp_project
  region  = var.region
}

resource "google_container_cluster" "gke_cluster" {
  name     = "wordpress-cluster"
  location = var.region
  remove_default_node_pool = true

  node_pool {
    name       = "wordpress-pool"
    node_count = 2
    
    autoscaling {
      min_node_count = 1
      max_node_count = 5
    }

    node_config {
      machine_type = "e2-medium"
      disk_size_gb = 50
    }
  }
}

