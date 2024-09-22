output "gke_cluser_name" {
  description = "GKE Cluster name"
  value       = google_container_cluster.gke_cluster.name
}

output "gke_cluster_location" {
  description = "GKE Cluster location"
  value       = google_container_cluster.gke_cluster.location
}

output "gke_cluster_endpoint" {
  description = "GKE Cluster Endpoint"
  value       = google_container_cluster.gke_cluster.endpoint
}

output "gke_cluster_master_version" {
  description = "GKE Cluster master version"
  value       = google_container_cluster.gke_cluster.master_version
}

output "gke_nodepool_id" {
  value = google_container_node_pool.nodepool_1.id
}

output "gke_nodepool_version" {
  value = google_container_node_pool.nodepool_1.version
}