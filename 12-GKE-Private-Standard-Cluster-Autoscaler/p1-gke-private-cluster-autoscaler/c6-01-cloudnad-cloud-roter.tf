resource "google_compute_router" "router" {
  name    = "${local.name}-cloud-router"
  network = google_compute_network.myvpc.name
  region  = var.gcp_region
}

resource "google_compute_router_nat" "nat" {
  name                               = "${local.name}router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
