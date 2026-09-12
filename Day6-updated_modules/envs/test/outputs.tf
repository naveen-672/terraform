output "instance_details" {
  description = "The test EC2 instance ID and IP addresses."
  value       = module.test_instance.instance_details
}
