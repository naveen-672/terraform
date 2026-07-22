resource "aws_vpc" "terraform_vpc" {
  tags = {
    Name = "terraform_VPC"
  }
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
}