resource "aws_instance" "dev_instance" {
  tags = {
    Name = var.iname
  }
  ami           = var.ami_id
  instance_type = var.itype
}
