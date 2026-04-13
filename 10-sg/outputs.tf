output "aws_security_group_ids" {
  value = flatten([for sg in module.aws_security_group : sg.sg_ids])
}