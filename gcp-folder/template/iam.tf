 module "folder_iam_members" {
  for_each = {
      for k, v in var.folder_iam_members: k => v
      }
  depends_on            = [module.folders]
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-folder-iam-member" # "../../modules/terraform-google-cloud-project-iam"
  folder                = each.value.folder 
  role                  = each.value.role
  members               = each.value.members
}

module "folder_iam_binding" {
  for_each = {
      for k, v in var.folder_iam_binding: k => v
      }
  depends_on            = [module.folder_iam_members]
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-folder-iam" # "../../modules/terraform-google-cloud-project-iam"
  folder                = each.value.folder 
  roles                 = each.value.roles
  members               = each.value.members
}

module "billing_iam_binding" {
  for_each = {
      for k, v in var.billing_iam_binding: k => v
      }
  depends_on            = [module.folder_iam_binding]
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-billing-iam" # "../../modules/terraform-google-cloud-project-iam"
  billing_id            = each.value.billing_id
  role                  = each.value.role
  members               = each.value.members
} 