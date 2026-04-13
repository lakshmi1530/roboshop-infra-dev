resource "aws_ssm_parameter" "sg_ids" {
  count = length(var.sg_names)
  name = "/${var.project}/${var.environment}/${var.sg_names[count.index]}-sg-id"
  type = "String"
  value = module.aws_security_group[count.index].sg_ids[0]
}