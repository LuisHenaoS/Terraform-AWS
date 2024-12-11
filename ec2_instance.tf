resource "aws_instance" "app_server" {
  ami                         = "ami-007868005aea67c54"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.app_subnet.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = false

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              echo "<h1>Servidor Apache funcionando en el puerto 8080 desde $(hostname -f)</h1>" > /var/www/html/index.html
              sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
              sed -i 's/^<VirtualHost _default_:80>/<VirtualHost _default_:8080>/' /etc/httpd/conf/httpd.conf
              systemctl start httpd
              systemctl enable httpd
              EOF
  )

  tags = {
    Name = "AppServer"
  }
}

resource "aws_instance" "app_server_2" {
  ami                         = "ami-007868005aea67c54"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.app_subnet_2.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = false

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              echo "<h1>Servidor Apache funcionando en el puerto 8080 desde $(hostname -f)</h1>" > /var/www/html/index.html
              sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
              sed -i 's/^<VirtualHost _default_:80>/<VirtualHost _default_:8080>/' /etc/httpd/conf/httpd.conf
              systemctl start httpd
              systemctl enable httpd
              EOF
  )

  tags = {
    Name = "AppServer2"
  }
}
