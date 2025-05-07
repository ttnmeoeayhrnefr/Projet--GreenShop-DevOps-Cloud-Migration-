resource "aws_route" "Ben-defroute" {
  route_table_id         = aws_vpc.Ben-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Ben-igw.id
}