variable "project_id" {
    default = "prj-o-tf-sa"
}
variable "vpc" {
    sensitive = false
}
variable "subnets" {
    sensitive = false
}
variable "router" {
    sensitive = false
}
variable "nat" {
    sensitive = false
}
variable "firewall" {
    sensitive = false
}
variable "global_address" {
    sensitive = false
}
variable "private_connection" {
    sensitive = false
}