module "buckets" {
  for_each = {
    for k, v in var.buckets: k => v
    }
  source                   = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-bucket"
  project_id               = each.value.project
  bucket_name              = each.value.bucket_name
  gcs_location             = each.value.gcs_location 
  force_destroy            = each.value.force_destroy
  enable_versioning        = each.value.enable_versioning
  labels                   = each.value.labels 
  public_access_prevention = each.value.public_access
  storage_class            = each.value.storage_class 
}