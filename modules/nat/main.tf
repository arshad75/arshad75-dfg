resource "google_compute_router" "router" {
  name    = "${var.project_id}-router"
  region  = var.region
  network = var.network
  project = var.project_id
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.project_id}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  project                            = var.project_id
}

variable "project_id" {}
variable "region" {}
variable "network" {}