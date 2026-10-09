provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "web_sg" {
  name        = "rakesh-tf-web-sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
}

resource "aws_instance" "web_server" {
  ami                    = "ami-03bb6d83c60fc5f7c"
  instance_type          = var.instance_type
  key_name               = "rakesh-key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              echo "<h1>Automated Terraform Deployment by Rakesh</h1>" > /var/www/html/index.html
              systemctl start nginx
              EOF

  tags = {
    Name = "Rakesh-Automated-Webserver"
  }
}

