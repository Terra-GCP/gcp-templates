#........................................... Scheduler ...........................................#

module "job-scheduler" {
  for_each = {
      for k, v in var.scheduler: k => v
      }
  source                        = "git@github.com:Terra-GCP/gcp-kitchen-modules//terraform-google-cloud-scheduler-job" # "../../modules/terraform-google-cloud-scheduler-job"
  depends_on                    = [module.pubsub]
  job_name                      = each.value.job_name 
  project_id                    = each.value.project_id 
  region                        = each.value.region 
  job_description               = each.value.job_description 
  schedule                      = each.value.schedule 
  time_zone                     = each.value.time_zone 
  attempt_deadline              = each.value.attempt_deadline 
  topic_name                    = each.value.topic_name     
}