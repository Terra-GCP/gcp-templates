variable "buckets" {
    sensitive = false
}
variable "project_id" {
    default = "prj-o-tf-sa"
}
variable "sa" {   
}
variable "sa_project_iam_binding" {
}
variable "sa_iam_binding" {
}
variable "pubsub" {
    sensitive = false
}
variable "scheduler" {
    sensitive = false
}
variable "secret" {
    sensitive = false
}
variable "build_connection" {
    sensitive = false
}
variable "build_trigger" {
    sensitive = false
}