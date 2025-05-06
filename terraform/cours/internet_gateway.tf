resource "aws_internet_gateway" "Ben-igw" {
  vpc_id = aws_vpc.Ben-vpc.id

  tags = {
    Name = "Ben-igw"
  }
}