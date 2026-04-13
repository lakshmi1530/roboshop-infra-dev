module "aws_security_group" {
  count = length(var.sg_names)
  source = "../../terraform-central/securitygroup"
  sg_names = replace(var.sg_names[count.index], " ", "-")
  vpc_id = local.vpc_id
  project     = var.project
  environment = var.environment
}