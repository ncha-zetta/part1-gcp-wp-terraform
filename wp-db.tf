resource "google_sql_database" "wordpress" {
  name     = "wordpress"
  instance = google_sql_database_instance.wordpress_db.name
}

resource "google_sql_user" "wordpress" {
  name     = "wp_user"
  instance = google_sql_database_instance.wordpress_db.name
  password = var.db_password
}

data "google_sql_database_instance" "wordpress_db" {
  name = google_sql_database_instance.wordpress_db.name
}

locals {
  cloud_sql_private_ip = [for ip in data.google_sql_database_instance.wordpress_db.ip_addresses : ip.ip_address if ip.type == "PRIVATE"][0]
}
