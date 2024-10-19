
# Global
variable "name_prefix" {}

# Network
variable "subnet_public_id" {}

# Security Group
variable "sg_id" {}

# VPC
variable "vpc_id" {}

locals {
  alb_name = "${var.name_prefix}-alb"
  tg_name = "${var.name_prefix}-tg"
}
