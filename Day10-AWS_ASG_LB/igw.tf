resource "aws_internet_gateway" "terraform-igw" {
  tags = {
    Name = "terraform-igw"
  }

  vpc_id = aws_vpc.terraform-vpc.id
}
