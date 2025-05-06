resource "aws_vpc" "Ben-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Ben-vpc"
  }
}