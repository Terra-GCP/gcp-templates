#...................................... Host Project VPC INT .....................................#

module "host_vpc" {
  for_each = {
      for k, v in var.vpc: k => v
      }
  source                                 = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-vpc" # "../../modules/terraform-google-cloud-vpc"
  network_name                           = each.value.network_name
  auto_create_subnetworks                = each.value.auto_create_subnetworks
  routing_mode                           = each.value.routing_mode
  project_id                             = each.value.project_id
  delete_default_internet_gateway_routes = each.value.delete_routes
  shared_vpc_host                        = each.value.shared_vpc_host
}


#.....................................Host Project Int Subnet ....................................#

module "host_vpc_subnets" {
  for_each = {
      for k, v in var.subnets: k => v
      }
  depends_on                            = [module.host_vpc]
  source                                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-subnet" # "../../modules/terraform-google-cloud-subnet"
  project_id                            = each.value.project_id
  network_name                          = each.value.network_name
  subnets                               = each.value.subnets
}

#.................................... Host Project Int VPC Data ..................................#

data "google_compute_network" "host_vpc_prd" {
    project                                 = "prj-o-15032023-prd-shr-nw"
    name                                    = "vpc-o-shr-prod"
    depends_on                              = [module.host_vpc]
}

#................................... Host Project DMZ VPC Data ...................................#

data "google_compute_network" "host_vpc_nprd" {
    project                                 = "prj-o-15032023-nprd-shr-nw"
    name                                    = "vpc-o-shr-nonprod"
    depends_on                              = [module.host_vpc]
}

#.................................... INT-to-DMZ VPC Peering .....................................#

module "prd_nprd_vpc_peering" {
  source                                     = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-vpc-peering" # "../../modules/terraform-google-cloud-vpc-peering"
  prefix                                     = "peering"
  local_network                              = data.google_compute_network.host_vpc_prd.self_link
  peer_network                               = data.google_compute_network.host_vpc_nprd.self_link
  export_local_custom_routes                 = false
  export_peer_custom_routes                  = false
  depends_on                                = [data.google_compute_network.host_vpc_prd]
}

#.................................... DMZ-to-INT VPC Peering .....................................#

module "nprd_prd_vpc_peering" {
  source                                     = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-vpc-peering" # "../../modules/terraform-google-cloud-vpc-peering"
  prefix                                     = "peering"
  local_network                              = data.google_compute_network.host_vpc_nprd.self_link
  peer_network                               = data.google_compute_network.host_vpc_prd.self_link
  export_local_custom_routes                 = false
  export_peer_custom_routes                  = false
  depends_on                                = [data.google_compute_network.host_vpc_nprd]
}

#......................................... Cloud Router NAT ......................................#

 module "host_router" {
  for_each = {
      for k, v in var.router: k => v
      }
  depends_on              = [module.host_vpc]
  source                  = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-router" # "../../modules/terraform-google-cloud-router"
  create_router           = each.value.create_router 
  router_name             = each.value.router_name 
  project_id              = each.value.project_id 
  region                  = each.value.region 
  network                 = each.value.network
}

module "host_nat" {
  for_each = {
      for k, v in var.nat: k => v
      }
  depends_on             = [module.host_router]
  source                 = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-nat" # "../../modules/terraform-google-cloud-nat"
  project_id             = each.value.project_id #"${module.host_project.project_id}"
  region                 = each.value.region #"asia-south1"
  nat_name               = each.value.nat_name #"gsdbu-nat"
  router_name            = each.value.router_name #"gsdbu-router"
  nat_ip_allocate_option = each.value.nat_ip_allocate_option #
  source_subnetwork_ip_ranges_to_nat = each.value.subnetwork_ranges #
  subnetworks            = each.value.subnetworks
}

/*
module "global_address" {
  for_each = {
      for k, v in var.global_address: k => v
      }
  depends_on             = [module.host_vpc]
  source                 = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-global-address" # "../../modules/terraform-google-cloud-nat"
  #provider              = google
  project_id             = each.value.project_id
  name                   = each.value.name
  address_type           = each.value.address_type
  purpose                = each.value.purpose
  prefix_length          = each.value.prefix_length
  network                = each.value.network
  address                = each.value.address
}

module "private_connection" {
  for_each = {
      for k, v in var.private_connection: k => v
      }
  depends_on             = [module.global_address]
  source                 = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-private-connection" # "../../modules/terraform-google-cloud-nat"
  network                = each.value.network
  service                = each.value.service
  ranges                 = each.value.ranges
} */