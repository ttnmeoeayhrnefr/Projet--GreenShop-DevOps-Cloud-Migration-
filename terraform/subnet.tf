resource "aws_subnet" "GreenShop-pub" {
  vpc_id     = aws_vpc.GreenShop-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "GreenShop-pub"
  }
}

resource "aws_subnet" "GreenShop-priv1" {
  vpc_id     = aws_vpc.GreenShop-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "GreenShop-priv1"
  }
}

resource "aws_subnet" "GreenShop-priv2" {
  vpc_id     = aws_vpc.GreenShop-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "GreenShop-priv2"
  }
}

resource "aws_subnet" "GreenShop-priv3" {
  vpc_id     = aws_vpc.GreenShop-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "GreenShop-priv3"
  }
}

resource "aws_subnet" "GreenShop-priv4" {
  vpc_id     = aws_vpc.GreenShop-vpc.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "GreenShop-priv4"
  }
}