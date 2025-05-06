resource "aws_route_table" "Ben-privrtb" {
  vpc_id = aws_vpc.Ben-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Ben-natgw.id
  }
}