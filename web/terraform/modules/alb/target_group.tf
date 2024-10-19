
resource "aws_lb_target_group" "default" {
  name = local.tg_name
  vpc_id = var.vpc_id
  target_type = "ip"
  port = 80
  protocol = "HTTP"

  health_check {
    path = "/"
    protocol = "HTTP"
    port = "traffic-port"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  depends_on = [aws_alb.default]
}
