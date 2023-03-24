#.................................... Folders Creation Output ....................................#

output "Folders_Details" {
  description = "Folder Details."
  value       = module.folders
}

#.................................. Organization Policy Output ...................................#

output "Org_Policy_Details" {
  description = "Organization Policy Details."
  #value       = module.main_folder.folder_name
  value       = module.org_policy
}

#...................................... Folder Policy Output .....................................#

output "Folder_Policy_Details" {
  description = "Folder Policy Details."
  #value       = module.main_folder.folder_name
  value       = module.folder_policy
}

#.................................... Folder IAM Member Output ...................................#

output "Folder_IAM_Member_Details" {
  description = "Folder IAM Member Details."
  value       = module.folder_iam_members
}

#.................................... Folder IAM Binding Output ..................................#

output "Folder_IAM_Binding_Details" {
  description = "Folder IAM Binding Details."
  value       = module.folder_iam_binding
}

#.................................... Billing IAM Binding Output .................................#

output "Billing_IAM_Binding_Details" {
  description = "Billing IAM Binding Details."
  value       = module.billing_iam_binding
} 