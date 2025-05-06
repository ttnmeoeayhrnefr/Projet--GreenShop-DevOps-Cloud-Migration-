resource "aws_instance" "Ben-INSTANCE-ADM" {
  key_name                 = "admin"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.Ben-SG-ADM.id]
  subnet_id                = aws_subnet.Ben-pub.id
  instance_type            = "t2.micro"
  associate_public_ip_address = true

  tags = {
    Name = "Ben-INSTANCE-ADM"
  }
}

resource "aws_instance" "Ben-INSTANCE-RPROXY" {
  key_name                 = "admin"
  ami                      = "ami-084568db4383264d4"
  security_groups          = [aws_security_group.Ben-SG-RPROXY.id]
  subnet_id                = aws_subnet.Ben-pub.id
  instance_type            = "t2.micro"
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              
              cat > /etc/nginx/conf.d/load-balancer.conf <<EOL
              upstream backend {
                  server ${aws_instance.Ben-INSTANCE-WEB1.private_ip};
                  server ${aws_instance.Ben-INSTANCE-WEB2.private_ip};
                  server ${aws_instance.Ben-INSTANCE-WEB3.private_ip};
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
    Name = "Ben-INSTANCE-RPROXY"
  }
}


resource "aws_instance" "Ben-INSTANCE-WEB1" {
  key_name        = "admin"
  ami             = "ami-084568db4383264d4"
  security_groups = [aws_security_group.Ben-SG-WEB.id]
  subnet_id       = aws_subnet.Ben-priv1.id
  instance_type   = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance 1" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Ben-INSTANCE-WEB1"
  }
}

resource "aws_instance" "Ben-INSTANCE-WEB2" {
  key_name        = "admin"
  ami             = "ami-084568db4383264d4"
  security_groups = [aws_security_group.Ben-SG-WEB.id]
  subnet_id       = aws_subnet.Ben-priv2.id
  instance_type   = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance 2" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Ben-INSTANCE-WEB2"
  }
}

resource "aws_instance" "Ben-INSTANCE-WEB3" {
  key_name        = "admin"
  ami             = "ami-084568db4383264d4"
  security_groups = [aws_security_group.Ben-SG-WEB.id]
  subnet_id       = aws_subnet.Ben-priv3.id
  instance_type   = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Hello from instance 3" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Ben-INSTANCE-WEB3"
  }
}
