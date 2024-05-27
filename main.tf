locals {
  network_config          = yamldecode(file("${path.module}/config/${var.network_yaml_file}"))
  network   = local.network_config.network
}


module "vpc" {
    source  = "app.terraform.io/tfc-demo-au/network/google//modules/vpc"
    version = "~> 0.0.0"

    project_id   = local.network.project_id
    network_name = local.network.network_name

    shared_vpc_host = local.network.shared_vpc_host
}