resource "aws_ssm_parameter" "mongo_sg_id" {
  name = "/${var.project}/${var.environment}/mongo_sg_id"
  type = "String"
  value = module.aws_security_group.sg_id
}