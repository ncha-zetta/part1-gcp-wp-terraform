resource "google_compute_network" "vpc_network" {
  name                    = "wp-vpc-network"
  auto_create_subnetworks = false
  project                 = var.gcp_project
}

resource "google_compute_subnetwork" "subnet" {
  name          = "wp-subnet"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  project       = var.gcp_project
}
