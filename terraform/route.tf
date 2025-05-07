resource "aws_route" "GreenShop-defroute" {
  route_table_id         = aws_vpc.GreenShop-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.GreenShop-igw.id
}
