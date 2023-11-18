terraform {
  backend "gcs" {
    bucket  = "part1-wp-tfstate"
    prefix  = "terraform/state"
  }
}
