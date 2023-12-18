# region
aws_region          = "us-east-1"

#access key and secert key
aws_access_key      = "" #Please provide your access key
aws_secret_key      = "" #Please provide your secret key

#Virtual Network Parameters
cidr                = "10.0.0.0/16"
snet-cidr           = "10.0.1.0/24"
aws-az              = "us-east-1a"

#instance type, name and keypair
ami                 = "ami-052efd3df9dad4825"
app_name            = "Healthelink"
app_environment     = "data"
instance_type       = "m5.xlarge"
instance_name       = "" #Provide your instance name
instance_keypair    = "" #Provide your instance keypair name
diskvolume          = "1024"


# security group name and instance key pair parameters
ec2-security-name   = "hel-ec2-sg"
efs-security-name = "efs-security-new"


