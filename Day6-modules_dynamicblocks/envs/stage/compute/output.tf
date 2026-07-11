output "details" {
  value = [aws_instance.stage_instance.id, aws_instance.stage_instance.public_ip, aws_instance.stage_instance.private_ip]
}
