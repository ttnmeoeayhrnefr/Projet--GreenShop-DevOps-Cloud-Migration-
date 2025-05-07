resource "aws_instance" "GreenShop-INSTANCE-BASTION" {
  key_name                 = "infra"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.GreenShop-SG-ADM.id]
  subnet_id                = aws_subnet.GreenShop-pub.id
  instance_type            = "t2.micro"
  associate_public_ip_address = true
  private_ip = "10.0.1.10"

  tags = {
    Name = "GreenShop-INSTANCE-ADM"
  }
}

resource "aws_instance" "GreenShop-INSTANCE-RPROXY" {
  key_name                 = "infra"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.GreenShop-SG-RPROXY.id]
  subnet_id                = aws_subnet.GreenShop-pub.id
  instance_type            = "t2.micro"
  associate_public_ip_address = true
  private_ip ="10.0.1.11"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              
              cat > /etc/nginx/conf.d/load-balancer.conf <<EOL
              upstream backend {
                  server ${aws_instance.GreenShop-INSTANCE-WEB1.private_ip};
                  server ${aws_instance.GreenShop-INSTANCE-WEB2.private_ip};
                  server ${aws_instance.GreenShop-INSTANCE-WEB3.private_ip};
              }

              server {
                  listen 80;

                  location / {
                      proxy_pass http://backend;
                      proxy_set_header Host \$host;
                      proxy_set_header X-Real-IP \$remote_addr;
                      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
                      proxy_set_header X-Forwarded-Proto \$scheme;
                  }
              }
              EOL
              
              systemctl restart nginx
              EOF

  tags = {
    Name = "GreenShop-INSTANCE-RPROXY"
  }
}


resource "aws_instance" "GreenShop-INSTANCE-WEB1" {
  key_name        = "infra"
  ami             = "ami-084568db4383264d4"
  security_groups = [aws_security_group.GreenShop-SG-WEB.id]
  subnet_id       = aws_subnet.GreenShop-priv1.id
  instance_type   = "t2.micro"
  private_ip ="10.0.2.5"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance 1" > /var/www/html/index.html
              EOF

  tags = {
    Name = "GreenShop-INSTANCE-WEB1"
  }
}

resource "aws_instance" "GreenShop-INSTANCE-WEB2" {
  key_name        = "infra"
  ami             = "ami-084568db4383264d4"
  security_groups = [aws_security_group.GreenShop-SG-WEB.id]
  subnet_id       = aws_subnet.GreenShop-priv2.id
  instance_type   = "t2.micro"
  private_ip ="10.0.3.5"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance 2" > /var/www/html/index.html
              EOF

  tags = {
    Name = "GreenShop-INSTANCE-WEB2"
  }
}

resource "aws_instance" "GreenShop-INSTANCE-WEB3" {
  key_name        = "infra"
  ami             = "ami-084568db4383264d4"
  security_groups = [aws_security_group.GreenShop-SG-WEB.id]
  subnet_id       = aws_subnet.GreenShop-priv3.id
  instance_type   = "t2.micro"
  private_ip ="10.0.4.5"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance 3" > /var/www/html/index.html
              EOF

  tags = {
    Name = "GreenShop-INSTANCE-WEB3"
  }
}

resource "aws_instance" "GreenShop-INSTANCE-DB1" {
  key_name                 = "infra"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.GreenShop-SG-WEB.id]
  subnet_id                = aws_subnet.GreenShop-priv4.id
  instance_type            = "t2.micro"
  private_ip = "10.0.5.20"

  tags = {
    Name = "GreenShop-INSTANCE-DB1"
  }
}

resource "aws_instance" "GreenShop-INSTANCE-DB2" {
  key_name                 = "infra"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.GreenShop-SG-WEB.id]
  subnet_id                = aws_subnet.GreenShop-priv4.id
  instance_type            = "t2.micro"
  private_ip = "10.0.5.21"

  tags = {
    Name = "GreenShop-INSTANCE-DB2"
  }
}

resource "aws_instance" "GreenShop-INSTANCE-JENKINS" {
  key_name                 = "infra"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.GreenShop-SG-ADM.id]
  subnet_id                = aws_subnet.GreenShop-pub.id
  instance_type            = "t2.micro"
  associate_public_ip_address = true
  private_ip = "10.0.1.12"

  tags = {
    Name = "GreenShop-INSTANCE-JENKINS"
  }
}