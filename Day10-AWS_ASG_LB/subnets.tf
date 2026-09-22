resource "aws_subnet" "public-sn-1" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "2a-public-sn"
  }

  availability_zone       = "ap-south-2a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-sn-2" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "2b-public-sn"
  }

  availability_zone       = "ap-south-2b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private-sn-1" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "2a-private-sn"
  }

  availability_zone = "ap-south-2a"
  cidr_block        = "10.0.2.0/24"
}

resource "aws_subnet" "private-sn-2" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "2b-private-sn"
  }

  availability_zone = "ap-south-2b"
  cidr_block        = "10.0.3.0/24"
}
