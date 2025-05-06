resource "aws_nat_gateway" "Ben-natgw" {
  subnet_id     = aws_subnet.Ben-pub.id
  allocation_id = aws_eip.Ben-nateip.id

  tags = {
    Name = "Ben-natgw"
  }
}
