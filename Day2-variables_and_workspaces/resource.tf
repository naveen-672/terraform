resource "aws_instance" "tf" {
  tags = {
    Name = var.iname
  }
  ami               = var.ami_id
  instance_type     = var.itype
  key_name          = var.key_pair
  availability_zone = var.az
  root_block_device {
    volume_size = var.ebs_volume
  }
}
