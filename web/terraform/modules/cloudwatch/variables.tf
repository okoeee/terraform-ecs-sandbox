
# Global
variable "name_prefix" {}

locals {
  logs_group_name = "/ecs/${var.name_prefix}-service"
  retation_in_days = 7
}
