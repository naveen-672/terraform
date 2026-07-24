resource "aws_vpc" "terraform-vpc" {
    tags = {
      Name = "MyVPC"
    }
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
}

resource "aws_subnet" "public-subnet-1" {
  tags = {
    Name = "public-sn-1"
  }

  vpc_id = aws_vpc.terraform-vpc.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-subnet-2" {
    tags = {
        Name = "public-sn-2"
    }
    vpc_id = aws_vpc.terraform-vpc.id
    availability_zone = "us-east-1b"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "terraform-igw" {
  tags = {
    Name = "MyInternetGateway"
  }
  vpc_id = aws_vpc.terraform-vpc.id
}

resource "aws_route_table" "terraform-rt" {
  tags = {
    Name = "public-route-table"
  }
  vpc_id = aws_vpc.terraform-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-igw.id
  }
}

resource "aws_route_table_association" "assoc1" {
  route_table_id = aws_route_table.terraform-rt.id
  subnet_id = aws_subnet.public-subnet-1.id
}

resource "aws_route_table_association" "assoc2" {
  route_table_id = aws_route_table.terraform-rt.id
  subnet_id = aws_subnet.public-subnet-2.id
}