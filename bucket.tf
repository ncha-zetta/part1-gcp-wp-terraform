resource "google_storage_bucket" "wordpress_media" {
  name          = var.wordpress_media_bucket_name
  location      = var.region
}