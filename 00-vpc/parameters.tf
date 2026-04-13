resource "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpc_id"
  type = "String"
  value = module.aws_vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
  type = "StringList"
  value = join(",", module.aws_vpc.public_subnet_ids) 
}
# converting list of string to string list as SSM parameter type is StringList and value should be comma seperated string
# example: if private_subnet_ids = ["subnet-12345", "subnet-67890"]
# then join(",", module.aws_vpc.private_subnet_ids) will convert it to "subnet-12345,subnet-67890"
# which is the expected format for StringList type in AWS SSM parameter store

resource "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project}/${var.environment}/private_subnet_ids"
  type = "StringList"
  value = join(",", module.aws_vpc.private_subnet_ids) 
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project}/${var.environment}/database_subnet_ids"
  type = "StringList"
  value = join(",", module.aws_vpc.database_subnet_ids) 
}