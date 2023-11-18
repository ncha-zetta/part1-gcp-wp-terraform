resource "google_sql_database_instance" "wordpress_db" {
  name             = "wordpress-db"
  database_version = "MYSQL_5_7"
  region           = var.region

  settings {
    tier = "db-f1-micro"
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
