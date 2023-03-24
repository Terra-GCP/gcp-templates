variable "project_id" {
    default = "prj-o-tf-sa"
}

/*
variable "credentials" {
    sensitive = true
    default = "eastern-lodge-374307-5eedac2e2288.json"
} 
*/
variable "folders" {
    sensitive = false
}

variable "org_policies" {
    sensitive = false
}
variable "folder_policies" {
    sensitive = false
}
variable "folder_iam_members" {
    sensitive = false
}
variable "folder_iam_binding" {
    sensitive = false
}
variable "billing_iam_binding" {
    sensitive = false
}