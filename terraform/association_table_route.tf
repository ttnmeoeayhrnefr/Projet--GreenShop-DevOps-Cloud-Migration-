resource "aws_route_table_association" "Ben-privrtb-assoc1" {
  route_table_id = aws_route_table.Ben-privrtb.id
  subnet_id      = aws_subnet.Ben-priv1.id
}

resource "aws_route_table_association" "Ben-privrtb-assoc2" {
  route_table_id = aws_route_table.Ben-privrtb.id
  subnet_id      = aws_subnet.Ben-priv2.id
}

resource "aws_route_table_association" "Ben-privrtb-assoc3" {
  route_table_id = aws_route_table.Ben-privrtb.id
  subnet_id      = aws_subnet.Ben-priv3.id
}