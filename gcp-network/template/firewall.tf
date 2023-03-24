#.............................. Host Project Firewall Rule .............................#

module "vpc_firewall_rule" {
  for_each = {
      for k, v in var.firewall: k => v
      }
  source       = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-firewall" # "../../modules/terraform-google-cloud-firewall"
  project_id   = each.value.project_id
  network_name = each.value.network_name 
  rules        = each.value.rules
}