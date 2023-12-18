terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

#provider "aws" {
#  region = var.aws_region
#  profile = "default"
#  access_key = var.aws_access_key
#  secret_key = var.aws_secret_key

#}
#/*
#Note-1:  AWS Credentials Profile (profile = "nithin") configured on your local desktop terminal  
#$HOME/.aws/credentials
#*/