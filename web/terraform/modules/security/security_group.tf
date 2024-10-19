
resource "aws_security_group" "default" {
  name = "${local.sg_name}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "ingress_from_alb" {
  type = "ingress"
  from_port = "80"
  to_port = "80"
  protocol = "TCP"
  security_group_id = aws_security_group.default.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ingress_sg_all" {
  type = "ingress"
  from_port = "0"
  to_port = "0"
  protocol = "-1"
  security_group_id = aws_security_group.default.id
  source_security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "egress_all" {
  type = "egress"
  from_port = "0"
  to_port = "0"
  protocol = "-1"
  security_group_id = aws_security_group.default.id
  cidr_blocks = ["0.0.0.0/0"]
}
