data "http" "my_public_ipv4" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project}/${var.environment}/bastion-sg-id"
}

data "aws_ssm_parameter" "mongodb_sg_id" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id"
}

data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project}/${var.environment}/user-sg-id"
}

data "aws_ssm_parameter" "catalogue_sg_id" {
  name = "/${var.project}/${var.environment}/catalogue-sg-id"
}

data "aws_ssm_parameter" "redis_sg_ids" {
  name = "/${var.project}/${var.environment}/redis-sg-id"
}

data "aws_ssm_parameter" "rabbitmq_sg_ids" {
  name = "/${var.project}/${var.environment}/rabbitmq-sg-id"
}

data "aws_ssm_parameter" "mysql_sg_ids" {
  name = "/${var.project}/${var.environment}/mysql-sg-id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
  name = "/${var.project}/${var.environment}/shipping-sg-id"
}

data "aws_ssm_parameter" "cart_sg_id" {
  name = "/${var.project}/${var.environment}/cart-sg-id"
}

data "aws_ssm_parameter" "payment_sg_id" {
  name = "/${var.project}/${var.environment}/payment-sg-id"
}

data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.project}/${var.environment}/backend-alb-sg-id"
}

data "aws_ssm_parameter" "frontend_alb_sg_id" {
  name = "/${var.project}/${var.environment}/frontend-alb-sg-id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project}/${var.environment}/frontend-sg-id"
}