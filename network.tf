resource "google_compute_network" "webapp_vpc" {
  name                    = var.webapp_vpc
  auto_create_subnetworks = "false"
}