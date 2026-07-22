resource "aws_route_table" "terraform_route_table" {
    tags = {
        Name = "public-route-table"
    }

    vpc_id = aws_vpc.terraform_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform_igw.id
    }
    
}