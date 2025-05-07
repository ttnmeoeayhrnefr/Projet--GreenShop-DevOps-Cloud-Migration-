resource "aws_internet_gateway" "GreenShop-igw" {
  vpc_id = aws_vpc.GreenShop-vpc.id

  tags = {
    Name = "GreenShop-igw"
  }
}
