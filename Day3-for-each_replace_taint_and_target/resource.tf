resource "aws_instance" "myinstance" {
  for_each = var.flm
  tags = {
    Name = each.value.iname
  }
  ami           = each.value.ami_id
  instance_type = each.value.itype
  key_name      = each.value.key_pair
}

variable "flm" {
  description = "this contains server configuration"
  type = map(object({
    iname         = string
    ami_id        = string
    itype = string
    key_pair      = string
  }))
}

