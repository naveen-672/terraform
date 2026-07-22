resource "aws_route_table" "terraform_route_table-1" {
  tags = {
    Name = "public-route-table"
  }

  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }

}

resource "aws_route_table" "terraform_route_table-2" {
  tags = {
    Name = "private-route-table"
  }
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_ngw.id
  }
}
