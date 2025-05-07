resource "aws_security_group" "Ben-SG-ADM" {
  name        = "Ben-SG-ADM"
  description = "Ben-SG-ADM"
  vpc_id      = aws_vpc.Ben-vpc.id

  ingress {
    description = "Allow SSH from External"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Ben-SG-RPROXY" {
  name        = "Ben-SG-RPROXY"
  description = "Ben-SG-RPROXY"
  vpc_id      = aws_vpc.Ben-vpc.id

  ingress {
    description = "Allow SSH from Admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.Ben-SG-ADM.id]
  }

  ingress {
    description = "Allow HTTP from External"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Ben-SG-WEB" {
  name        = "Ben-SG-WEB"
  description = "Ben-SG-WEB"
  vpc_id      = aws_vpc.Ben-vpc.id

  ingress {
    description = "Allow SSH from Admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.Ben-SG-ADM.id]
  }

  ingress {
    description = "Allow HTTP from Reverse Proxy"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.Ben-SG-RPROXY.id]
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}