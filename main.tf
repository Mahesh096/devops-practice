provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Create a Virtual Private Cloud
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = {
    Name        = "${var.app_name}-vpc"
    Environment = "${var.app_environment}"
  }
}

# Create a private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.snet-cidr
  availability_zone = var.aws-az

  tags = {
    Name        = "${var.app_name}-Private"
    Environment = "${var.app_environment}"
  }
}

# EC2 instance in the private subnet
resource "aws_instance" "ec2-instance" {
  ami                          = var.ami
  instance_type                = var.instance_type
  key_name                     = var.instance_keypair
  subnet_id                    = aws_subnet.private.id
  associate_public_ip_address  = false  # No public IP
  iam_instance_profile         = aws_iam_role.instance.name
  tags = {
    Name = var.instance_name
  }
  # ... (Other configurations)

  # Security Group for the private instance, denying all inbound and outbound traffic
  security_groups = [aws_security_group.private_sec.id]
}

# Security Group for the private instance, denying all inbound and outbound traffic
resource "aws_security_group" "private_sec" {
  description = "Security Group for Private EC2 Instance"
  name        = "${var.ec2-security-name}-private"
  vpc_id      = aws_vpc.vpc.id

  # Deny all inbound traffic
  ingress {
    description = "Deny all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Deny from all sources
  }

  # Deny all outbound traffic
  egress {
    description = "Deny all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Deny to all destinations
  }

  tags = {
    Name = "${var.ec2-security-name}-private"
  }
}

