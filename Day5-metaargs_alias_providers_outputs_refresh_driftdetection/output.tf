output "details" {
  value = [aws_instance.nv.id, aws_instance.nv.public_ip, aws_instance.nv.private_ip, aws_instance.nv.public_dns]
}
