resource "aws_route_table_association" "assoc1" {
    route_table_id = aws_route_table.terraform_route_table.id
    subnet_id = aws_subnet.subnet-1.id
}

resource "aws_route_table_association" "assoc2" {
    route_table_id = aws_route_table.terraform_route_table.id
    subnet_id = aws_subnet.subnet-2.id
}