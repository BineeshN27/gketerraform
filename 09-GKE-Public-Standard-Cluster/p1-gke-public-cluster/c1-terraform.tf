terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.3.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-on-gcp-gke-bineesh"
    prefix = "dev/gke-cluster-public"
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  #export GOOGLE_APPLICATION_CREDENTIALS=<path to the file>
}