#............................................ Bucket .............................................#

output "Bucket_Details" {
    value = module.buckets
}

#......................................... Service Account .......................................#

output "Service_Account_Details" {
    value = module.service_account
}

#........................................ SA Project IAM .........................................#

output "Service_Account_Project_IAM_Details" {
    value = module.sa_project_iam_binding
}

#............................................ SA IAM .............................................#

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

#........................................... Secret ..............................................#

output "Secret_Details" {
    value = module.secret
}

#........................................ Build Connection .......................................#

output "Build_Connection_Details" {
    value = module.build_connection
}

#.......................................... Build Trigger ........................................#

output "Build_Trigger_Details" {
    value = module.build_trigger
}