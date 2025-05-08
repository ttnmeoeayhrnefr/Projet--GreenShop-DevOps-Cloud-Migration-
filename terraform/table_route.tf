resource "aws_route_table" "GreenShop-privrtb" {
  vpc_id = aws_vpc.GreenShop-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.GreenShop-natgw.id
  }
}
