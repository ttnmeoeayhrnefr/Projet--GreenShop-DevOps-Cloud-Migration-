resource "aws_vpc" "GreenShop-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "GreenShop-vpc"
  }
}