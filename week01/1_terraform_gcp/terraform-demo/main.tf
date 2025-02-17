terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.20.0"
    }
  }
}

provider "google" {
  credentials = "./keys/my-creds.json"
  project     = "terraform-demo-451211"
  region      = "us-central1"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "terraform-demo-451211-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }
}