
# Global
variable "name_prefix" {}

# Network
variable "subnet_public_id_a" {}
variable "subnet_public_id_c" {}

# Security Group
variable "alb_sg_id" {}

# VPC
variable "vpc_id" {}

locals {
  alb_name = "${var.name_prefix}-alb"
  tg_name = "${var.name_prefix}-tg"
}
