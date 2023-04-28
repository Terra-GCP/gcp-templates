package main
 
import input as tfplan

# check if array contains element
array_contains(arr, elem) {
    # iterate over arr, assert it contains elem
	arr[_] = elem
}

get_basename(path) = basename{
    arr := split(path, "/")
    basename:= arr[count(arr)-1]
}

#................................... Deny if machine type not allowed ..................................#

allowed_types = {
    "google": ["n1-standard-1", "e3-medium"]
}

# Attribute name for instance type/size by provider
instance_type_key = {
    "google": "machine_type"
}

# Extracts the instance type/size
get_instance_type(resource) = instance_type {
    provider_name := get_basename(resource.provider_name)
    instance_type := resource.change.after[instance_type_key[provider_name]]
}

deny[msg] {
    resource := tfplan.resource_changes[_]
    instance_type := get_instance_type(resource)
    provider_name := get_basename(resource.provider_name)
    not array_contains(allowed_types[provider_name], instance_type)
    msg := "Selected Instance Type not allowed"
}

#..................................... Deny if resource not allowed ....................................#

# Allowed Terraform resources

allowed_resources = [
"google_compute_address",
"google_compute_address",
"google_compute_disk",
"google_compute_disk",
"google_compute_firewall",
"google_compute_network",
"google_compute_subnetwork",
#"google_filestore_instance",
"google_service_account",
"google_compute_instance",
"google_compute_instance_group",
"google_os_config_patch_deployment",
"google_compute_resource_policy",
]

deny[msg] {
  resource := tfplan.resource_changes[_]
  action := resource.change.actions[count(resource.change.actions) - 1]
  array_contains(["create", "update"], action)  # allow destroy action
  not array_contains(allowed_resources, resource.type)
  msg := "Selected Resource Type not allowed"
}

#..................................... Deny if project does not match ..................................#

# Restrict all resources to one project
required_project = "prj-n-15032023-nprd-uat-svc"

deny[msg] {
	resource := tfplan.resource_changes[_]
  
  project_id := resource.change.after.project
  not project_id == required_project
  
  msg := "Provided Project ID not allowed"
}


#.............................. Deny if region/zome does not match ...............................#

# Enforce a list of allowed locations / availability zones
allowed_locations = {
    "google": ["us-central1-a", "us-central1-b", "us-west1-a", "asia-south2-a"]
}
eval_expression(plan, expr) = constant_value {
    constant_value := expr.constant_value
} else = reference {
    ref = expr.references[0]
    startswith(ref, "var.")
    var_name := replace(ref, "var.", "")
    reference := plan.variables[var_name].value
}

get_location(resource, plan) = google_zone {
    provider_name := get_basename(resource.provider_name)
    "google" == provider_name
    google_zone := resource.change.after.zone
}

deny[msg] {
    resource := tfplan.resource_changes[_]
    location := get_location(resource, tfplan)
    provider_name := get_basename(resource.provider_name)
    not array_contains(allowed_locations[provider_name], location)

    msg := "Provided Location not allowed"
}
