resource "aws_route_table" "public-rt" {
  tags = {
    Name = "public-rt"
  }

  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }
}

resource "aws_route_table" "private-rt" {
  tags = {
    Name = "private-rt"
  }

  vpc_id = aws_vpc.terraform-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.terraform-nat-gateway.id
  }
}
