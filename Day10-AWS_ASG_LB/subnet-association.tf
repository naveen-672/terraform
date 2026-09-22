resource "aws_route_table_association" "public-ass1" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-sn-1.id
}

resource "aws_route_table_association" "public-ass2" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-sn-2.id
}

resource "aws_route_table_association" "private-ass1" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id      = aws_subnet.private-sn-1.id
}

resource "aws_route_table_association" "private-ass2" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id      = aws_subnet.private-sn-2.id
}
