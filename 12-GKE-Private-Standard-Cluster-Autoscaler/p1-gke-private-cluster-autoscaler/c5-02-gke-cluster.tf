resource "google_container_cluster" "gke_cluster" {
  name                     = "${local.name}-gke-cluster"
  location                 = var.gcp_region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.myvpc.self_link
  subnetwork               = google_compute_subnetwork.subnet.self_link
  deletion_protection      = false

  node_locations = data.google_compute_zones.compute_zone_available.names
  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.k8s_master_ip_range
  }

  ip_allocation_policy {
    # cluster_ipv4_cidr_block  = var.k8s_pods_ip_range
    # services_ipv4_cidr_block = var.k8s_service_ip_range
    cluster_secondary_range_name = google_compute_subnetwork.subnet.secondary_ip_range[0].range_name
    services_secondary_range_name = google_compute_subnetwork.subnet.secondary_ip_range[1].range_name
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "0.0.0.0/0"
      display_name = "entire-internet"
    }
  }

}