#.......................................... VM Instance ..........................................#

module "VM" {
  for_each = {
      for k, v in var.vms: k => v
      }
  source        = "git::https://github.com/Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-instance"
                # "git::ssh://admin@gcpkitchen.live@source.developers.google.com:2022/p/prj-o-tf-sa/r/github_terra-gcp_gcp-kitchen-modules//terraform-google-cloud-instance"
                # "../../modules/terraform-google-cloud-instance"
  name          = each.value.name
  project_id    = each.value.project_id
  zone          = each.value.zone
  machine_type  = each.value.machine_type
  subnet        = each.value.subnet
  image         = each.value.image
  tags          = each.value.tags
  hostname      = each.value.hostname
  service_account_scopes = each.value.service_account_scopes
  labels        = each.value.labels
  metadata      = each.value.metadata
}

/* SSH
"git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-instance"

https
"git::https://github.com/Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-instance" */

module "instance_iam_binding" {
  for_each = {
      for k, v in var.instance_iam_binding: k => v
      }
  depends_on            = [module.VM]
  source                = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-compute-instance-iams" # "../../modules/terraform-google-cloud-project-iam"
  instance_name         = each.value.instance_name
  zone                  = each.value.zone
  project_id            = each.value.project_id
  members               = each.value.members
  roles                 = each.value.roles
  condition             = {}
  
}