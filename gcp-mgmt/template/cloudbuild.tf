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
  name                          = each.value.name
  description                   = each.value.description
  tags                          = each.value.tags
  disabled                      = each.value.disabled
  substitutions                 = each.value.substitutions
  service_account               = each.value.service_account
  include_build_logs            = each.value.build_logs
  filename                      = each.value.filename
  filter                        = each.value.filter

  git_file_source               = each.value.git_file_source
  repository_event_config       = each.value.repository_event_config
  source_to_build               = each.value.source_to_build

  ignored_files                 = each.value.ignored_files
  included_files                = each.value.included_files

  trigger_template              = each.value.trigger_template
  github                        = each.value.github
  bitbucket_server_trigger_config = each.value.bitbucket_server_trigger_config
  pubsub_config                 = each.value.pubsub_config
  webhook_config                = each.value.webhook_config
  approval_config               = each.value.approval_config
  build                         = each.value.build

  location                      = each.value.location
  project_id                    = each.value.project_id



  trigger_name                  = each.value.trigger_name 
  path                          = each.value.path
  uri                           = each.value.uri
  repo_type                     = each.value.repo_type
  revision                      = each.value.revision
  topic                         = each.value.topic
  approval_required             = each.value.approval_required
}