provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Subnet
resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    Name = var.subnet_name
  }
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main_subnet.id
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = var.instance_name
  }
}
