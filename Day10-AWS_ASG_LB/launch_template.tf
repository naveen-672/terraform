resource "aws_launch_template" "terraform-launch-temp" {
  name        = "terraform-launch-template"
  description = "lauch template for auto-scaling groups"

  image_id               = "ami-0d810b4169227c0ca"
  instance_type          = "t3.micro"
  key_name               = "hydkp"
  vpc_security_group_ids = [aws_security_group.asg_instances.id]

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }

  user_data = base64encode(
    <<-EOF
    #! /bin/bash
    sudo yum install nginx -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "<h1>instance hostname is $hostname" >> /var/www/html/index.html
    EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "terraform-asg-instance1"
    }
  }
}
