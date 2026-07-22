resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "public-subnet-1"
  }
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet-2" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "public-subnet-2"
  }
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet-3" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "private-subnet-1"
  }
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.2.0/24"
}

resource "aws_subnet" "subnet-4" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "private-subnet-2"
  }
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.3.0/24"
}