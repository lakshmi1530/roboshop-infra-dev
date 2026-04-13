locals {
    common_tags = {
    project     = var.project
    Environment = var.environment
    terraform   = "true"
  }
  
  ami_id = data.aws_ami.joindevops_ami.id
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0] #pulling publicsubnet in 1a az
  bastion_sg_id= data.aws_ssm_parameter.bastion_security_group_id.value
}