locals {
    common_tags = {
    project     = var.project
    Environment = var.environment
    terraform   = "true"
  }
  
  ami_id = data.aws_ami.joindevops_ami.id
  database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0] #pulling publicsubnet in 1a az
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_ids.value
}