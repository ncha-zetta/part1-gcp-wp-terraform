resource "google_compute_network" "vpc_network" {
  name                    = "i-wp-vpc-network"
  auto_create_subnetworks = false
  project                 = var.gcp_project
}

resource "google_compute_subnetwork" "subnet" {
  name          = "i-wp-subnet"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.240.0.0/16"
  region        = var.region
  project       = var.gcp_project
}
