# Existing infrastructure references used below:
#   VPC:             aws_vpc.terraform-vpc.id
#   Public subnets:  aws_subnet.public-sn-1.id, aws_subnet.public-sn-2.id
#   Private subnets: aws_subnet.private-sn-1.id, aws_subnet.private-sn-2.id


resource "aws_security_group" "alb" {
  name        = "terraform-alb-sg"
  description = "Allows public HTTP traffic to the application load balancer"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-alb-sg"
  }
}

resource "aws_security_group" "asg_instances" {
  name        = "terraform-asg-instances-sg"
  description = "Allows HTTP only from the application load balancer"
  vpc_id      = aws_vpc.terraform-vpc.id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-asg-instances-sg"
  }
}

resource "aws_lb" "application" {
  name               = "terraform-application-alb"
  internal           = false
  load_balancer_type = "application"
  subnets = [
    aws_subnet.public-sn-1.id,
    aws_subnet.public-sn-2.id,
  ]
  security_groups = [aws_security_group.alb.id]

  tags = {
    Name = "terraform-application-alb"
  }
}

resource "aws_lb_target_group" "application" {
  target_type = "instance"
  name        = "terraform-app-target-group"
  protocol    = "HTTP"
  port        = 80
  vpc_id      = aws_vpc.terraform-vpc.id

  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
    matcher  = "200"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.application.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application.arn
  }
}


resource "aws_autoscaling_group" "application" {
  name = "terraform-application-asg"
  launch_template {
    id      = aws_launch_template.terraform-launch-temp.id
    version = "$Latest"
  }
  vpc_zone_identifier       = [aws_subnet.private-sn-1.id, aws_subnet.private-sn-2.id]
  target_group_arns         = [aws_lb_target_group.application.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 180
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 4
  tag {
    key                 = "Name"
    value               = "terraform-asg-instance"
    propagate_at_launch = true
  }
}

#Whenever the ASG launches an EC2 instance, automatically register that instance with the application target group.
#  target_group_arns         = [aws_lb_target_group.application.arn]
