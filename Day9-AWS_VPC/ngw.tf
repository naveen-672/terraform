resource "aws_eip" "terraform_ngw_eip" {
  domain = "vpc"

  tags = {
    Name = "terraform_NGW_EIP"
  }
}

resource "aws_nat_gateway" "terraform_ngw" {
  allocation_id = aws_eip.terraform_ngw_eip.id
  subnet_id     = aws_subnet.subnet-1.id

  tags = {
    Name = "terraform_NGW"
  }

  depends_on = [aws_internet_gateway.terraform_igw]
}
