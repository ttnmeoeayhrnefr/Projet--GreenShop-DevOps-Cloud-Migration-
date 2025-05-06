provider "aws" {
  region = "us-east-1"
}

# 1. VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MiniVPC"
  }
}

# 2. Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet"
  }
}

# 3. Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "MyIGW"
  }
}

# 4. Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "PublicRouteTable"
  }
}

# 5. Route Table Association
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt.id
}

# 6. Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AllowSSH"
  }
}

# 7. Elastic IP
resource "aws_eip" "public_ip" {
  domain = "vpc"
}

# 8. EC2 instances
resource "aws_instance" "web1" {
  ami                    = "ami-084568db4383264d4" # Ubuntu 24.04
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "WebServer1"
  }
}

resource "aws_instance" "web2" {
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "WebServer2"
  }
}

resource "aws_instance" "web3" {
  ami                    = "ami-084568db4383264d4"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "WebServer3"
  }
}

# 9. Attacher Elastic IP à Web1 (optionnel, Terraform gère déjà l'IP publique)
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web1.id
  allocation_id = aws_eip.public_ip.id
}
