
resource "aws_ecs_service" "default" {
  name = local.ecs_service_name
  cluster = aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.defalut.arn
  desired_count = local.service_count
  launch_type = local.task_requires_compatibilities

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name = local.ecs_service_name
    container_port = var.web_app_port
  }

  network_configuration {
    subnets = [
      var.subnet_public_id_a,
      var.subnet_public_id_c
    ]
    security_groups = [var.ecs_sg_id]
    assign_public_ip = true
  }
}
