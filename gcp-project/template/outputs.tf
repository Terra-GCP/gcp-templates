#....................................... Projects Output ........................................#

output "Projects_Details" {
  description = "Detail of the projects"
  value       = module.projects
  sensitive   = true
}

#..................................... Service Projects Output ..................................#

output "Service_Project_Details" {
  description = "Details of the service project"
  value       = module.service_project
  sensitive   = false
}

#.................................... Service Project API Output ................................#

output "Projects_APIs_Details" {
  value = module.project_apis
  description = "Project API details"
}

#......................................... Budget Quota .........................................#

output "Billing_Budget_Details" {
    value = module.billing_budget
}