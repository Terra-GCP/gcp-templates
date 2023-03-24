 module "org_policy" {
  for_each = {
      for k, v in var.org_policies: k => v
      }
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-org-policy"
  depends_on            = [module.folders]
  policy                = each.value.policy
  organization_id       = each.value.organization_id
  constraint            = each.value.constraint
  allow                 = each.value.allow
}

module "folder_policy" {
  for_each = {
      for k, v in var.folder_policies: k => v
      }
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-folder-policy"
  depends_on            = [module.folders]
  policy                = each.value.policy
  folder_id             = each.value.folder_id
  constraint            = each.value.constraint
  allow                 = each.value.allow
} 