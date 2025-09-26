provider "google" {
  project = "windy-skyline-467604-b5"   # Replace with your Google Cloud project ID
  region  = "us-central1"            # Replace with your desired region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}



resource "google_storage_bucket" "example_bucket" {
  name          = "hcp-terraform-123"  # Replace with a unique bucket name
  location      = "US"                     # You can change the location to suit your needs
  storage_class = "STANDARD"               # You can use different storage classes like "NEARLINE", "COLDLINE", etc.
  force_destroy = true                     # This allows Terraform to delete non-empty buckets (be careful!)
}

data "terraform_remote_state" "bucket" {
  backend = "remote"

  config = {
    organization = "vijay-dev"
    workspaces = {
      name = "dev"
    }
  }
}

output "bucket_id_from_remote" {
  value = data.terraform_remote_state.bucket.outputs.bucket_id
}

