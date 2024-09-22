terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.3.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.32.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-on-gcp-gke-bineesh"
    prefix = "dev/k8s-demo1"
  }
}