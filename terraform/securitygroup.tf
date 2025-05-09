resource "aws_security_group" "GreenShop-SG-ADM" {
  name        = "GreenShop-SG-ADM"
  description = "GreenShop-SG-ADM"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow SSH from External"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "GreenShop-SG-RPROXY" {
  name        = "GreenShop-SG-RPROXY"
  description = "GreenShop-SG-RPROXY"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow SSH from Admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.GreenShop-SG-ADM.id]
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

resource "aws_security_group" "GreenShop-SG-WEB" {
  name        = "GreenShop-SG-WEB"
  description = "GreenShop-SG-WEB"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow SSH from Admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.GreenShop-SG-ADM.id]
  }

  ingress {
    description = "Allow HTTP from Reverse Proxy"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.GreenShop-SG-RPROXY.id]
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "GreenShop-SG-DB" {
  name        = "GreenShop-SG-DB"
  description = "GreenShop-SG-DB"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow SSH from Admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.GreenShop-SG-ADM.id]
  }

  ingress {
    description = "Allow mysql from web"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.GreenShop-SG-WEB.id]
  }

  egress {
    description = "Allow out Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "GreenShop-SG-JENKINS" {
  name        = "GreenShop-SG-JENKINS"
  description = "GreenShop-SG-JENKINS"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow SSH from External"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_ips
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

resource "aws_security_group" "GreenShop-SG-PROMETHEUS" {
  name        = "GreenShop-SG-PROMETHEUS"
  description = "GreenShop-SG-PROMETHEUS"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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

resource "aws_security_group" "GreenShop-SG-GRAFANA" {
  name        = "GreenShop-SG-GRAFANA"
  description = "GreenShop-SG-GRAFANA"
  vpc_id      = aws_vpc.GreenShop-vpc.id

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
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