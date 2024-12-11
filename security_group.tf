
resource "aws_security_group" "app_sg" {
  name        = "app_security_group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.app_vpc.id

ingress {
  description = "SSH Access"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["${var.YOUR_PUBLIC_IP}/32"]
}

ingress {
  description = "App Port"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["${var.YOUR_PUBLIC_IP}/32"]
}


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}