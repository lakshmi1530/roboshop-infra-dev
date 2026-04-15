data "aws_ami" "joindevops_ami" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project}/${var.environment}/database_subnet_ids"
}

data "aws_ssm_parameter" "mongodb_sg_ids" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id"
}

data "aws_ssm_parameter" "redis_sg_ids" {
  name = "/${var.project}/${var.environment}/redis-sg-id"
}

data "aws_ssm_parameter" "mysql_sg_ids" {
  name = "/${var.project}/${var.environment}/mysql-sg-id"
}

data "aws_ssm_parameter" "rabbitmq_sg_ids" {
  name = "/${var.project}/${var.environment}/rabbitmq-sg-id"
}