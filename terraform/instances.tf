#  Asia masters and workers
resource "google_compute_instance" "master_asia" {
  count        = 3
  name         = "master-asia-${count.index}"
  machine_type = "e2-small"
  zone         = var.asia_zones[count.index]

  tags = ["ssh"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet_asia.self_link
    network_ip = var.master_ips_asia[count.index]
  }
  metadata = {
    ssh-keys = "${var.user}:${file(var.ssh_pub_key)}"
  }
}

# resource "google_compute_instance" "worker_asia" {
#   count        = 3
#   name         = "worker-asia-${count.index}"
#   machine_type = "e2-small"
#   zone         = var.asia_zones[count.index]

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2004-lts"
#     }
#   }
#   network_interface {
#     subnetwork = google_compute_subnetwork.private_subnet_asia.self_link
#     network_ip = var.worker_ips_asia[count.index]
#   }
#   metadata = {
#     ssh-keys = "${var.user}:${file(var.ssh_pub_key)}"
#   }
# }

# # USA masters and workers
# resource "google_compute_instance" "master_usa" {
#   count        = 3
#   name         = "master-usa-${count.index}"
#   machine_type = "e2-small"
#   zone         = var.usa_zones[count.index]

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2004-lts"
#     }
#   }
#   network_interface {
#     subnetwork = google_compute_subnetwork.private_subnet_usa.self_link
#     network_ip = var.master_ips_usa[count.index]
#   }
#   metadata = {
#     ssh-keys = "${var.user}:${file(var.ssh_pub_key)}"
#   }
# }

# resource "google_compute_instance" "worker_usa" {
#   count        = 3
#   name         = "worker-usa-${count.index}"
#   machine_type = "e2-small"
#   zone         = var.usa_zones[count.index]

#   tags = ["foo", "bar"]

#   boot_disk {
#     initialize_params {
#       image = "ubuntu-os-cloud/ubuntu-2004-lts"
#     }
#   }
#   network_interface {
#     subnetwork = google_compute_subnetwork.private_subnet_usa.self_link
#     network_ip = var.worker_ips_usa[count.index]
#   }
#   metadata = {
#     ssh-keys = "${var.user}:${file(var.ssh_pub_key)}"
#   }
# }