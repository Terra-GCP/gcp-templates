#..................................... Folder Configuration .....................................#

module "folders" {
  for_each = {
      for k, v in var.folders: k => v
      }
  source       = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-folder"
  folder_name  = each.value.folder_name
  parent       = each.value.parent
}