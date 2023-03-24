module "service_account" {
  for_each = {
    for k, v in var.sa: k => v
    }
  source                   = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-sa"
  project                  = each.value.project
  display_name             = each.value.display_name
  account_id               = each.value.account_id
}

/* module "service_account_key" {
  for_each = {
    for k, v in var.sa_key: k => v
    }
  source                   = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-sa-key"
  service_account_id       = each.value.service_account_id
  public_key_type          = each.value.public_key_type
} */