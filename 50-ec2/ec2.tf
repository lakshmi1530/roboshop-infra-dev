resource "aws_instance" "ec2_instance" {
  ami           = local.ami_id
  instance_type = lookup(var.instance_type, local.environment ) #lookup(map name, key, default_value)
  vpc_security_group_ids = [aws_security_group.allow_all.id] #first it will run the dependencies automatically

  tags = {
    Name = "${var.project}-${local.environment}" #roboshop-dev
    Environment=local.environment
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all_terraform-${local.environment}"
  description = "Allow all inbound and outbound traffic for Terraform"

    ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
      Name= "allow_all_terraform-${local.environment}"
    }
}