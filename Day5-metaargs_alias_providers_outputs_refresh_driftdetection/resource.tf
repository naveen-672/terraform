resource "aws_instance" "nv" {
  tags = {
    Name = "NV-instance"
  }
  ami               = "ami-002192a70217ac181"
  instance_type     = "c7i-flex.large"
  key_name          = "MyKeyPair"
  availability_zone = "us-east-1c"
  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
    ignore_changes        = [tags, instance_type]
  }
}

resource "aws_instance" "hyd" {
  tags = {
    Name = "hyd-instance"
  }
  provider          = aws.hyd_region
  ami               = "ami-0795a1d68c086ce01"
  instance_type     = "t3.micro"
  key_name          = "hydkp"
  availability_zone = "ap-south-2b"
}
