resource "aws_route_table_association" "GreenShop-privrtb-assoc1" {
  route_table_id = aws_route_table.GreenShop-privrtb.id
  subnet_id      = aws_subnet.GreenShop-priv1.id
}

resource "aws_route_table_association" "GreenShop-privrtb-assoc2" {
  route_table_id = aws_route_table.GreenShop-privrtb.id
  subnet_id      = aws_subnet.GreenShop-priv2.id
}

resource "aws_route_table_association" "GreenShop-privrtb-assoc3" {
  route_table_id = aws_route_table.GreenShop-privrtb.id
  subnet_id      = aws_subnet.GreenShop-priv3.id
}

resource "aws_route_table_association" "GreenShop-privrtb-assoc4" {
  route_table_id = aws_route_table.GreenShop-privrtb.id
  subnet_id      = aws_subnet.GreenShop-priv4.id
}