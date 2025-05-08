resource "aws_nat_gateway" "GreenShop-natgw" {
  subnet_id     = aws_subnet.GreenShop-pub.id
  allocation_id = aws_eip.GreenShop-nateip.id

  tags = {
    Name = "GreenShop-natgw"
  }
}
