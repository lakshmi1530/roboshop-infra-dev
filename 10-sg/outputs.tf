output "sg_ids" {
  value = module.aws_security_group[*].sg_ids
}