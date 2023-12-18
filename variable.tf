variable "aws_access_key" {
  description = "AWS access key"
  type = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type = string
}

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
}

variable "aws-az" {
  description = "The availability zone"
  type = string
}

variable "app_name" {
  type        = string
}

variable "app_environment" {
  type        = string
}

#AWS Instance AMI
variable "ami" {
  description = "EC2 Instnace AMI"
  type = string
}

variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
}

variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
}

variable "diskvolume" {
  description = "EC2 instance disk size in GB. Put numerical value"
  type = string
}

variable "cidr" {
  type        = string
  description = "The Cidr Block Range"
}

variable "snet-cidr" {
  type        = string
  description = "The Cidr Block Range for the private subnet"
}

variable "ec2-security-name" {
  description = "security name"
  type = string
}

variable "instance_name" {
  description = "AWS EC2 instance name"
  type = string
}

variable "email" {
  description = "VPC ID"
  type = string
}
