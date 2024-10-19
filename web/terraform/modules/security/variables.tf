
# Global
variable "name_prefix" {}

# Security Group
variable "vpc_id" {}

locals {
  sg_name = "${var.name_prefix}-sg"
}
