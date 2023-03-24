output "Bucket_Details" {
    value = module.buckets
}
output "Service_Account_Details" {
    value = module.service_account
}
/* output "Service_Account_Key_Details" {
    value = module.service_account_key
    sensitive = true
} */
output "Service_Account_Project_IAM_Details" {
    value = module.sa_project_iam_binding
}
output "Service_Account_IAM_Details" {
    value = module.sa_iam_binding
}

#.......................................... Pubsub Topic .........................................#

output "Pubsub_Details" {
    value = module.pubsub
}

#........................................... Scheduler ...........................................#

output "Job_Scheduler_Details" {
    value = module.job-scheduler
}