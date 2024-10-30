variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "main_vpc"
}

variable "subnet_name" {
  description = "Name for the subnet"
  type        = string
  default     = "main_subnet"
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "allow_ssh"
}

variable "ssh_port" {
  description = "SSH port for security group ingress"
  type        = number
  default     = 22
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]  # Caution: Allowing SSH from any IP
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "web_server"
}
