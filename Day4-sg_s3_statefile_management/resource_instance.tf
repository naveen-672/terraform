resource "aws_instance" "myinstance" {
  tags = {
    Name = "terraform_instance"
  }
  ami                    = "ami-002192a70217ac181"
  instance_type          = "t3.micro"
  key_name               = "MyKeyPair"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  root_block_device {
    volume_size = 11
  }
}
