resource "aws_eip" "terraform-eip" {
  tags = {
    Name = "terraform-elastic-ip"
  }
  domain = "vpc"
}

resource "aws_nat_gateway" "terraform-nat-gateway" {
  tags = {
    Name = "terraform-nat-gateway"
  }
  subnet_id     = aws_subnet.public-sn-1.id
  allocation_id = aws_eip.terraform-eip.id
  depends_on    = [aws_internet_gateway.terraform-igw]
}
