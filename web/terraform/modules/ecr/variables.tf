
# Global
variable "name_prefix" {}

locals {
  repository_name = "${var.name_prefix}-repository"
  container_name = "${var.name_prefix}-container"
}
