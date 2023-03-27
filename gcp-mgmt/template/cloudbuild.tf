#.................................... Cloud Build Connection .................................#

module "build_connection" {
  for_each = {
    for k, v in var.build_connection: k => v
    }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-build-connection"
  location                      = each.value.location
  connection_name               = each.value.connection_name
  app_id                        = each.value.app_id
  oauth_token                   = each.value.oauth_token
  project_id                    = each.value.project_id
  repo_name                     = each.value.repo_name 
  remote_uri                    = each.value.remote_uri   
}

#...................................... Cloud Build Trigger ...................................#

/* module "build_trigger" {
  for_each = {
    for k, v in var.build_trigger: k => v
    }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-build-trigger"
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