resource "aws_instance" "bastion" {
  ami           = data.aws_ami.joindevops_ami.id
  instance_type = "t3.micro"
  subnet_id     = local.public_subnet_ids
  vpc_security_group_ids = [local.bastion_sg_id]
  iam_instance_profile = aws_iam_instance_profile.bastion.name

   # Using user_data to install Terraform on the instance itself
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y yum-utils
              sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
              sudo yum -y install terraform
              EOF

  tags = merge(
    local.common_tags, 
    {
      Name = "${var.project}-${var.environment}-bastion"
    }
  )
}

resource "aws_iam_role" "bastion_role" {
  name = "${var.project}-${var.environment}-bastion-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    local.common_tags, 
  {
    Name = "${var.project}-${var.environment}-bastion-role"
  }
  )
}

resource "aws_iam_role_policy_attachment" "bastion_policy_attachment" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

#create instance profile and attach to bastion role
resource "aws_iam_instance_profile" "bastion" {
  name = "${var.project}-${var.environment}-bastion"
  role = aws_iam_role.bastion_role.name
}

#1. we create a role for bastion host
#2. we attach AmazonEC2FullAccess policy to the role
#3. we create an instance profile and attach the role to the instance profile