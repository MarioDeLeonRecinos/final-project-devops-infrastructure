terraform {
  required_providers {
    google = {
      source = "hashicorp/google"

    }
  }

  backend "gcs" {
    bucket = "smooth-obelisk-356719"
    prefix = "terraform/state"
  }
}
provider "google" {
  version = "4.27.0"
  project = "smooth-obelisk-356719"
  region  = "us-west1"
  zone    = "us-west1-c"
}