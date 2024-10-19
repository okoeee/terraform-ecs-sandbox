
resource "aws_cloudwatch_log_group" "default" {
  name = "${local.logs_group_name}"
  retention_in_days = local.retation_in_days
}
