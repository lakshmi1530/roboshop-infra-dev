module "aws_vpc" {
  source        = "../../terraform-central/vpc"
  project       = var.project
  environment   = var.environment
  is_peering_required = true
}
