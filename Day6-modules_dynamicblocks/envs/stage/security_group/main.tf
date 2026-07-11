resource "aws_security_group" "stage_sg" {
  name        = var.sg_name
  description = var.sg_description

  dynamic "ingress" {
    for_each = var.ports
    iterator = ingress

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
