
resource "aws_security_group" "alb_sg" {
  name = "${local.sg_name}-alb"
  vpc_id = "${var.vpc_id}"

  ingress {
    description = "Allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ecs_sg" {
  name = "${local.sg_name}-ecs"
  vpc_id = "${var.vpc_id}"

  egress {
    description = "Allow all outbound traffic"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_alb_to_ecs" {
  security_group_id = aws_security_group.ecs_sg.id
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
