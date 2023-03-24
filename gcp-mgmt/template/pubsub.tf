#.......................................... Pubsub Topic .........................................#

module "pubsub" {
  for_each = {
      for k, v in var.pubsub: k => v
      }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-pubsub" # "../../modules/terraform-google-cloud-pubsub"
  depends_on                    = [module.sa_project_iam_binding]
  topic_name                    = each.value.topic_name 
  project_id                    = each.value.project_id 
  labels                        = each.value.labels
  message_retention_duration    = each.value.message_retention_duration
  subscription_name             = each.value.subscription_name
  retain_acked_messages         = each.value.retain_acked_messages
  ack_deadline_seconds          = each.value.ack_deadline_seconds 
  ttl                           = each.value.ttl
  minimum_backoff               = each.value.minimum_backoff
  enable_message_ordering       = each.value.enable_message_ordering
}