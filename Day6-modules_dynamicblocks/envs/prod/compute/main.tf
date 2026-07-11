resource "aws_instance" "prod_instance" {
  tags = {
    Name = var.iname
  }
  ami           = var.ami_id
  instance_type = var.itype
}
