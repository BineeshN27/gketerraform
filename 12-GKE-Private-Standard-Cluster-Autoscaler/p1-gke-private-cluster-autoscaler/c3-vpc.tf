# Resource: VPC
resource "google_compute_network" "myvpc" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}

# Resource: subnetwork
resource "google_compute_subnetwork" "subnet" {
  name                     = "${local.name}-${var.gcp_region}-subnet"
  region                   = var.gcp_region
  ip_cidr_range            = "10.128.0.0/20"
  network                  = google_compute_network.myvpc.id
  private_ip_google_access = true
  secondary_ip_range {
    ip_cidr_range = var.k8s_pods_ip_range
    range_name    = "k8s-pods-ip-range"
  }
  secondary_ip_range {
    ip_cidr_range = var.k8s_service_ip_range
    range_name    = "k8s-service-ip-range"
  }
}