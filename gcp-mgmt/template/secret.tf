module "secret" {
  for_each = {
      for k, v in var.secret: k => v
      }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-secret" # "../../modules/terraform-google-cloud-pubsub"
  depends_on                    = [module.job-scheduler]
  project_id                    = each.value.project_id 
  secret_id                     = each.value.secret_id
  labels                        = each.value.labels
  location                      = each.value.location
  secret_data                   = file(each.value.secret_data)
}