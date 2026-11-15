provider "aws" {
  region = var.aws_region
}

# Створення Security Group (відкриваємо SSH (22) та порт застосунку (3000))
resource "aws_security_group" "app_sg" {
  name        = "app-security-group"
  description = "Allow inbound traffic on port 22 and 3000"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Node.js App"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Створення EC2 інстансу
resource "aws_instance" "app_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "DevOps-Terraform-Server"
  }
}
