resource "google_container_node_pool" "nodepool_1" {
  name     = "${local.name}-node-pool-1"
  location = var.gcp_region
  #cluster    = google_container_cluster.gke_cluster.name
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1
  node_config {
    preemptible     = true
    machine_type    = var.machine_type
    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0]]
  }

}