
resource "aws_alb" "default" {
  name = local.alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [var.sg_id]
  subnets = [
    var.subnet_public_id_a,
    var.subnet_public_id_c
  ]
  idle_timeout = 60
  enable_deletion_protection = false
}

resource "aws_alb_listener" "default" {
  load_balancer_arn = aws_alb.default.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}
