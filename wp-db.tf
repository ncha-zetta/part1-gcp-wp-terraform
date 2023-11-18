resource "google_sql_database_instance" "wordpress_db" {
  name             = var.cloud_sql_name
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      private_network = google_compute_network.default.self_link
    }
  }
}

resource "google_sql_database" "wordpress" {
  name     = "wordpress"
  instance = google_sql_database_instance.wordpress_db.name
}

resource "google_sql_user" "wordpress" {
  name     = "wp_user"
  instance = google_sql_database_instance.wordpress_db.name
  password = var.db_password
}
