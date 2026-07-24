resource "aws_elb" "terraform-loadbalancer" {
    name = "MyLoadbalancer"
    subnets = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
    security_groups = [aws_security_group.terraform-sg.id]

    listener {
      lb_port = 80
      lb_protocol = "http"
      instance_port = 80
      instance_protocol = "http"
    }
}

resource "aws_autoscaling_group" "terraform-asg" {
  name = "MyASG"

  launch_template {
    id = aws_launch_template.terraform-template.id
    version = "$Latest"
  }

  load_balancers = [aws_elb.terraform-loadbalancer.name]
  
  vpc_zone_identifier = [ aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id ]
  min_size = 2
  max_size = 6
  desired_capacity = 2

  tag {
    key                 = "Name"
    value               = "ASG-Instance"
    propagate_at_launch = true
  }
}