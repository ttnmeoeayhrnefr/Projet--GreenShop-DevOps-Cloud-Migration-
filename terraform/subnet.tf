resource "aws_subnet" "Ben-pub" {
  vpc_id     = aws_vpc.Ben-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Ben-pub"
  }
}

resource "aws_subnet" "Ben-priv1" {
  vpc_id     = aws_vpc.Ben-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Ben-priv1"
  }
}

resource "aws_subnet" "Ben-priv2" {
  vpc_id     = aws_vpc.Ben-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Ben-priv2"
  }
}

resource "aws_subnet" "Ben-priv3" {
  vpc_id     = aws_vpc.Ben-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Ben-priv3"
  }
}