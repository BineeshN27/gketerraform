resource "google_compute_firewall" "fw_ssh" {
  name    = "${local.name}-fwrile-allow-ssh22"
  network = google_compute_network.myvpc.id
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-tag"]
}