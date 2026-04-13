resource "aws_security_group_rule" "bastion_internet" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [local.my_ipv4]
  security_group_id = local.bastion_sg_id
  description = "allowing ssh access to bastion from my public ipv4 address"
}

resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
#   cidr_blocks       = [aws_vpc.vpc.cidr_block]
  security_group_id = local.mongodb_sg_id #either cidr_blocks or source_security_group_id should be there not both
  source_security_group_id =local.bastion_sg_id
  description = "allowing mongodb access from bastion"
}

resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = local.mongodb_sg_id
  source_security_group_id =local.catalogue_sg_id
  description = "allowing mongodb access from catalogue"
}

resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.user_sg_id
  description = "allowing mongodb access from user"
}