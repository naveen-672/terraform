resource "aws_internet_gateway" "terraform_igw" {
  tags = {
    Name = "terraform_IGW"
  }
  vpc_id = aws_vpc.terraform_vpc.id
}