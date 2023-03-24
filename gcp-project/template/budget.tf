#..................................... Billing Budget Quota ......................................#

module "billing_budget" {
  for_each = {
      for k, v in var.billing_budget: k => v
      }
  depends_on                        = [module.project_apis]
  source                            = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-budget" # "../../modules/terraform-google-cloud-budget"
  budget_name                       = each.value.budget_name 
  billing_account_id                = each.value.billing_account_id
  project_id                        = each.value.project_id
  budget_amount                     = each.value.budget_amount
  budget_notify_name                = each.value.budget_notify_name
  email_address                     = each.value.email_address
}