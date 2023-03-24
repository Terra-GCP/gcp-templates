module "sa_project_iam_binding" {
  for_each = {
      for k, v in var.sa_project_iam_binding: k => v
      }
  depends_on            = [module.service_account]
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-project-iam" # "../../modules/terraform-google-cloud-project-iam"
  project_id            = each.value.project_id
  roles                 = each.value.roles
  members               = each.value.members
}

module "sa_iam_binding" {
  for_each = {
      for k, v in var.sa_iam_binding: k => v
      }
  depends_on            = [module.service_account]
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-sa-iam" # "../../modules/terraform-google-cloud-project-iam"
  service_account       = each.value.service_account
  roles                 = each.value.roles
  members               = each.value.members
}