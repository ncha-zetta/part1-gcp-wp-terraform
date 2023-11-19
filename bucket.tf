resource "google_storage_bucket" "wordpress_media" {
  name          = var.wordpress_media_bucket_name
  location      = var.region
}

resource "google_storage_bucket_iam_binding" "wordpress_media_public" {
  bucket = google_storage_bucket.wordpress_media.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}