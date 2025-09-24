provider "google" {
  project = "windy-skyline-467604-b5"   # Replace with your Google Cloud project ID
  region  = "us-central1"            # Replace with your desired region
  credentials = var.google_credentials
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

variable "google_credentials" {
  description = "GCP service account JSON content"
  type        = string
  sensitive   = true
}


resource "google_storage_bucket" "example_bucket" {
  name          = "hcp-terraform-123"  # Replace with a unique bucket name
  location      = "US"                     # You can change the location to suit your needs
  storage_class = "STANDARD"               # You can use different storage classes like "NEARLINE", "COLDLINE", etc.
  force_destroy = true                     # This allows Terraform to delete non-empty buckets (be careful!)
}
