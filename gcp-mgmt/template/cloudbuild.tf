#...................................... Cloud Build Trigger ...................................#

/* module "build-trigger" {
  source                        = "../../modules/terraform-google-cloud-build-trigger"
  trigger_name                  = "gcp-tfe-destruction"
  location                      = "europe-north1"
  description                   = "Trigger Terraform resources destruction"
  path                          = "./cloud-build-destroy.yaml"
  repo_type                     = "CLOUD_SOURCE_REPOSITORIES"
  revision                      = "Prod"
  subscription                  = "tfe-destruction"
  topic                         = "tfe-pubsub"
  project_id                    = "eastern-lodge-374307"
  repo_name                     = "modules"
  branch_name                   = "Prod"
  tags                          = ["build", "newFeature"]
  logs_bucket                   = "gs://tfe-gcp-scale-delivery-env1/build-trigger-logs/"    
} */