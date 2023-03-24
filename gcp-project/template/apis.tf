#.................................. Service Project API Services .................................#

module "project_apis" {
  for_each = {
      for k, v in var.apis: k => v
      }
  depends_on                            = [module.projects]
  source                                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-apis" # "../../modules/terraform-google-cloud-apis"
  project_id                            = each.value.project_id
  gcp_apis_list                         = each.value.gcp_apis_list
}