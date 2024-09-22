provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  #export GOOGLE_APPLICATION_CREDENTIALS=<path to the file>
}

# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}

data "google_container_cluster" "gke_cluster" {
  name     = data.terraform_remote_state.gke.outputs.gke_cluser_name
  location = data.terraform_remote_state.gke.outputs.gke_cluster_location
}

output "gke_cluster_details" {
  value = {
    gke_endpoint = data.google_container_cluster.gke_cluster.endpoint
  }
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.gke_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate,
  )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}