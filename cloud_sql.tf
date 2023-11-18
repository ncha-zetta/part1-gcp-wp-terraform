resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "cloud-sql-private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}

resource "google_sql_database_instance" "wordpress_db" {
  name             = var.cloud_sql_name
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      private_network = google_compute_network.vpc_network.id
    }
  }
}
