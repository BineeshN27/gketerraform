resource "google_container_node_pool" "nodepool_1" {
  name       = "${local.name}-node-pool-1"
  location   = var.gcp_region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1
  node_config {
    preemptible     = true
    machine_type    = var.machine_type
    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags         = [tolist(google_compute_firewall.fw_ssh.target_tags)[0]]
    disk_type    = "pd-standard"
    disk_size_gb = 20
  }

  autoscaling {
    min_node_count  = 1
    max_node_count  = 3
    location_policy = "ANY"
  }

}