/* output "VMs_Name" {
  value       = module.VM[*].instance_name
  sensitive   = false
  description = "The Name of the instances being created"
}

output "VMs_Self_Link" {
  value       = module.VM.instance_self_link
  sensitive   = true
  description = "The Self_Link of the instances being created"
} */