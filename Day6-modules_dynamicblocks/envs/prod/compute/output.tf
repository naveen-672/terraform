output "details" {
  value = [aws_instance.prod_instance.id, aws_instance.prod_instance.public_ip, aws_instance.prod_instance.private_ip]
}
