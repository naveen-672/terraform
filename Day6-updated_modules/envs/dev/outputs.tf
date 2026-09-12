output "instance_details" {
  description = "The dev EC2 instance ID and IP addresses."
  value       = module.dev_instance.instance_details
}
