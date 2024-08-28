provider "google" {
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source       = "./modules/vpc"
  project_id   = var.project_id
  region       = var.region
  subnet_cidr  = var.subnet_cidr
  pod_cidr     = var.pod_cidr
  service_cidr = var.service_cidr
}

module "nat" {
  source     = "./modules/nat"
  project_id = var.project_id
  region     = var.region
  network    = module.vpc.network
}

variable "project_id" {}
variable "region" {}
variable "subnet_cidr" {}
variable "pod_cidr" {}
variable "service_cidr" {}