provider "aws" {
  region = "ap-south-1"
}

# 1. Default VPC & Subnets (Using default for easy routing)
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# 2. Security Group (Open Port 80 for HTTP)
resource "aws_security_group" "alb_sg" {
  name   = "rakesh-alb-sg"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
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

# 3. Web Server ONE
resource "aws_instance" "server_one" {
  ami                    = "ami-03bb6d83c60fc5f7c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.alb_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y && apt install nginx -y
              echo "<h1>Hello from Web Server ONE</h1>" > /var/www/html/index.html
              systemctl start nginx
              EOF

  tags = { Name = "Rakesh-Server-1" }
}

# 4. Web Server TWO
resource "aws_instance" "server_two" {
  ami                    = "ami-03bb6d83c60fc5f7c"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.alb_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y && apt install nginx -y
              echo "<h1>Hello from Web Server TWO</h1>" > /var/www/html/index.html
              systemctl start nginx
              EOF

  tags = { Name = "Rakesh-Server-2" }
}

# 5. Target Group (List of servers behind Load Balancer)
resource "aws_lb_target_group" "tg" {
  name     = "rakesh-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.server_one.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.server_two.id
  port             = 80
}

# 6. The Load Balancer itself
resource "aws_lb" "alb" {
  name               = "rakesh-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = data.aws_subnets.default.ids
}

# 7. Listener (Directs traffic from Load Balancer to Target Group)
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# 8. Output the Load Balancer URL
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}
