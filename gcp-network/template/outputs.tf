#.......................................... Host VPC Output ....................................#

output "Host_VPC_Details" {
  value       = module.host_vpc
  description = "The details of the Host INT VPC being created"
}

 
#................................. Host Project Subnet Output ..................................#

output "Host_VPC_Subnet_Details" {
  value = module.host_vpc_subnets
  description = "The created subnet resources"
}

#........................................ VPC Peering Output ...................................#

output "VPC_Peering_1_2" {
  value = module.prd_nprd_vpc_peering
  description = "VPC Peering 1-2"
}

output "VPC_Peering_2_1" {
  value = module.nprd_prd_vpc_peering
  description = "VPC Peering 2-1"
}

 #........................................ Cloud Router NAT .....................................#

output "Cloud_Router_Details" {
  value = module.host_router
  description = "Cloud Router Details"
}

#........................................... Cloud NAT .........................................#

output "Cloud_NAT_Details" {
  value = module.host_nat
  description = "Cloud NAT Details"
}

/*
#......................................... Global Address ......................................#

output "Global_Address_Details" {
  value = module.global_address
  description = "Global Address Details"
}

#..................................... Private Connection ......................................#

output "Private_Networking_Connection_Details" {
  value = module.private_connection
  description = "Private Networking Connection Details"
}
 */
#................................. Host Project VPC Firewall ...................................#

output "VPC_Firewall_Rule" {
  value = module.vpc_firewall_rule
  description = "The URI of the created resource"
}
