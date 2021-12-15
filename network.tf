resource "google_compute_network" "webapp_vpc" {
  name                    = var.webapp_vpc
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "private_subnet_asia" {
  name          = "private-subnet-asia"
  ip_cidr_range = var.private_subnet_asia_cidr
  region        = var.private_subnet_asia_region
  network       = google_compute_network.webapp_vpc.id
}

resource "google_compute_subnetwork" "private_subnet_usa" {
  name          = "private-subnet-asia"
  ip_cidr_range = var.private_subnet_usa_cidr
  region        = var.private_subnet_usa_region
  network       = google_compute_network.webapp_vpc.id
}

resource "google_compute_router" "asia_router" {
  name    = "asia-router"
  network = google_compute_network.webapp_vpc.id
  region  = var.private_subnet_asia_region
}

resource "google_compute_router" "usa_router" {
  name    = "usa-router"
  network = google_compute_network.webapp_vpc.id
  region  = var.private_subnet_usa_region
}

resource "google_compute_router_nat" "asia_router_nat" {
  name                               = "asia-router-nat"
  router                             = google_compute_router.asia_router.name
  region                             = google_compute_router.asia_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.private_subnet_asia.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

resource "google_compute_router_nat" "usa_router_nat" {
  name                               = "usa-router-nat"
  router                             = google_compute_router.usa_router.name
  region                             = google_compute_router.usa_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.private_subnet_usa.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}