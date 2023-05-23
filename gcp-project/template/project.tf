#..................................... Project Configuration .....................................#

module "projects" {
  for_each = {
      for k, v in var.projects: k => v
      }
  source                         = "git::ssh://admin@gcpkitchen.live@source.developers.google.com:2022/p/prj-o-tf-sa/r/github_terra-gcp_gcp-kitchen-modules//terraform-google-cloud-project"
                                 # "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-project"
  billing_account_id             = each.value.billing_account_id 
  project_name                   = each.value.project_name 
  project_id                     = each.value.project_id
  folder_id                      = each.value.folder_id
  auto_create_network            = each.value.auto_create_network
}

module "service_project" {
  for_each = {
      for k, v in var.service_project: k => v
      }
  depends_on                        = [module.projects]
  source                            = "git::ssh://admin@gcpkitchen.live@source.developers.google.com:2022/p/prj-o-tf-sa/r/github_terra-gcp_gcp-kitchen-modules//terraform-google-cloud-service-project"
                                    # "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-service-project" # "../../modules/terraform-google-cloud-service-project"
  enable_shared_vpc_service_project = each.value.enable_shared_vpc_service_project
  host_project                      = each.value.host_project
  service_project                   = each.value.service_project
}