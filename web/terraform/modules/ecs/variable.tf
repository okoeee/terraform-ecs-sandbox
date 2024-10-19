
# Global
variable "region" {}
variable "name_prefix" {}
variable "web_app_port" {}

variable "ecr_repository_uri" {}
variable "execution_role_arn" {}

variable "logs_group_name" {}
variable "target_group_arn" {}
variable "subnet_public_id" {}
variable "security_group_id" {}

locals {
  ecs_cluster_name = "${var.name_prefix}-ecs-cluster"
  ecs_service_name = "${var.name_prefix}-ecs-service"

  task_definition_filepath = "${path.module}/task_definition.json"
  task_definition_template = templatefile(local.task_definition_filepath, {
    SERVICE_NAME = local.ecs_service_name
    ECR_ARN = var.ecr_repository_uri
    LOGS_GROUP_NAME = var.logs_group_name
    LOG_DRIVER = local.task_log_driver
    REGION = var.region
  })
  task_definition_name = "${var.name_prefix}-task"
  task_cpu = 256
  task_memory = 512

  task_log_driver = "awslogs"
  task_network_mode = "awsvpc"
  task_requires_compatibilities = ["FARGATE"]

  service_count = 1
}
