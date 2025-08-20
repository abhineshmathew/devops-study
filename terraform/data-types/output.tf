output "sample_sting"{
  value       = var.name
  description = "description"
}

output "sample_number" {
  value       = var.age
  description = "description"
}

output "sample_boolean" {
  value       = var.is_active
  description = "description"
}


output "sample_string_value" {
  value       = "Hello ${var.string_value}"
  description = "description"
}

output "sample_string_with_validation" {
  value       = var.string_with_validation
  description = "description"
}

output "sample_object_variable" {
  value       = var.object_variable
  description = "description"
}
