data "google_compute_zones" "compute_zone_available" {
  region = var.gcp_region
  status = "UP"
}

output "compute_zone" {
  value = data.google_compute_zones.compute_zone_available.names
}