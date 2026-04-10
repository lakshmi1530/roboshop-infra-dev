module "aws_security_group" {
  source = "../../terraform-central/securitygroup"
  sg_name = "catalog-sg"
  vpc_id = local.vpc_id
  project     = var.project
  environment = var.environment
}