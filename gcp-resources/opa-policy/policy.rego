package terraform
 
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


#................................. Deny if project does not match ................................#

# Restrict all resources to one project
required_project = "prj-n-15032023-nprd-uat-svc"

deny[msg] {
	resource := tfplan.resource_changes[_]
  
  project_id := resource.change.after.project
  not project_id == required_project

	msg := sprintf("%q: Project %q is not allowed. Must be %q", [resource.address, project_id, required_project])
}


#.............................. Deny if region/zone does not match ...............................#

# Enforce a list of allowed locations / availability zones

allowed_locations = {
    "google": ["us-central1-a", "asia-south2-a"]
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

deny[reason] {
    resource := tfplan.resource_changes[_]
    location := get_location(resource, tfplan)
    provider_name := get_basename(resource.provider_name)
    not array_contains(allowed_locations[provider_name], location)

    reason := sprintf(
        "%s: location %q is not allowed",
        [resource.address, location]
    )
}


# Allowed sizes by provider

allowed_types = {
    "google": ["n1-standard-1", "e2-medium"]
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

deny[reason] {
    resource := tfplan.resource_changes[_]
    instance_type := get_instance_type(resource)
    provider_name := get_basename(resource.provider_name)
    not array_contains(allowed_types[provider_name], instance_type)

    reason := sprintf(
        "%s: instance type %q is not allowed",
        [resource.address, instance_type]
    )
}

#................................ Block protocols that aren't TCP ................................#

deny[msg] {
	resource := tfplan.resource_changes[_]
  
  allow := resource.change.after.allow[_]

  not allow.protocol == "tcp"

	msg := sprintf("%q: Protocol %q is not allowed. Must be tcp", [resource.address, allow.protocol])
}

#........................................ Block banned ports ......................................#

# Ban ports
banned_ports = ["80", "22"]

deny[msg] {
	resource := tfplan.resource_changes[_]
  
  allow := resource.change.after.allow[_]
  port := allow.ports[_]

  array_contains(banned_ports, port)

	msg := sprintf("%q: Port %q is not allowed.", [resource.address, port])
}

#....................................... Block banned labels ......................................#

# Ban labels
banned_labels = [""]

deny[msg] {
	resource := tfplan.resource_changes[_]
  
    labels := resource.change.after.labels["group"]
    #not labels == banned_labels


	msg := sprintf("%q: Label %q is not allowed.", [resource.address, labels])
}

#............................... Warn Resources create/delete labels ...............................#

warn[sprintf(message, [action, resource.address])] {
  message  := "action '%s' requires human review (%s)"
  review   := {"create", "delete"}
  resource := input.resource_changes[_]
  action   := resource.change.actions[_]
  review[action]
}