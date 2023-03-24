output "VMs_Details" {
  value       = module.VM
  sensitive   = true
  description = "The detail of the instances being created"
}