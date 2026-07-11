output "details" {
  value = [aws_instance.dev_instance.id, aws_instance.dev_instance.public_ip, aws_instance.dev_instance.private_ip]
}
