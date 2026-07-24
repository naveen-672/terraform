resource "aws_launch_template" "terraform-template" {
  name = "launch-template-1"
  description = "this is the template created through terraform"

  image_id = "ami-0b826bb6d96d2afe4"
  instance_type = "t3.micro"
  key_name = "MyKeyPair"
  vpc_security_group_ids = [aws_security_group.terraform-sg.id]
  
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 11
    }
  }

  user_data = base64encode(<<-EOF
  #! /bin/bash
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "<h1>this is an instance hostname: $(hostname)</h1>" >> /var/www/html/index.html
  EOF
  )
  
}

