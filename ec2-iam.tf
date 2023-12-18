#Cretaing EC2 IAM role for creating ec2 instance
resource "aws_iam_role_policy_attachment" "instance" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",

  ])

  role       = aws_iam_role.instance.name
  policy_arn = each.value
}

#Create an IAM role for the instance
resource "aws_iam_role" "instance" {
  name = "ec2role-instance"
  description = "EC2 IAM role for the instance"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ec2.amazonaws.com"]
      },
      "Effect": "Allow"
    }
  ]
}
   
EOF
}

# Create the IAM profile for the instance
resource "aws_iam_instance_profile" "instance" {
  role = aws_iam_role.instance.name
  name = "ec2role-instance"
}