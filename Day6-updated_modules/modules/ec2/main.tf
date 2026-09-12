resource "aws_instance" "myinstance" {
  tags = {
    Name = var.iname
  }
  ami           = var.ami_id
  instance_type = var.itype
  key_name      = var.iname
  root_block_device {
    volume_size = var.volume_size
  }
}
