resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = var.webapp_vpc

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags = ["ssh"]
  target_tags = ["ssh"]
}