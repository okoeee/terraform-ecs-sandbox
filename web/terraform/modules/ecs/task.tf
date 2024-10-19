
resource "aws_ecs_task_definition" "defalut" {
  container_definitions = local.task_definition_template
  family = local.task_definition_name
  cpu = local.task_cpu
  memory = local.task_memory
  network_mode = local.task_network_mode
  requires_compatibilities = [local.task_requires_compatibilities]
  execution_role_arn = var.execution_role_arn
}
