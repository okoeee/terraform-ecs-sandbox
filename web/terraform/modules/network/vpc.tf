
resource "aws_vpc" "ecr_sandbox" {
  cidr_block = local.vpc_cidr
}
