#.................................... Cloud Build Connection .................................#

module "build_connection" {
  for_each = {
    for k, v in var.build_connection: k => v
    }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-build-connection"
  depends_on                    = [module.secret]
  location                      = each.value.location
  connection_name               = each.value.connection_name
  app_id                        = each.value.app_id
  oauth_token                   = each.value.oauth_token
  project_id                    = each.value.project_id
  repo_name                     = each.value.repo_name 
  remote_uri                    = each.value.remote_uri   
}

#...................................... Cloud Build Trigger ...................................#

module "build_trigger" {
  for_each = {
    for k, v in var.build_trigger: k => v
    }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-build-trigger"
  depends_on                    = [module.build_connection]
  trigger_name                  = each.value.trigger_name 
  location                      = each.value.location
  disabled                      = each.value.disabled
  project_id                    = each.value.project_id
  #build_logs                    = each.value.build_logs
  description                   = each.value.description 
  path                          = each.value.path
  uri                           = each.value.uri
  repo_type                     = each.value.repo_type
  revision                      = each.value.revision
  topic                         = each.value.topic
  approval_required             = each.value.approval_required
}