
resource "aws_security_group" "default" {
  name = "${local.sg_name}"
  vpc_id = "${var.vpc_id}"
}

resource "aws_security_group_rule" "ingress_sg_all" {
  from_port = "0"
  to_port = "0"
  protocol = "-1"
  security_group_id = aws_security_group.default.id
  source_security_group_id = aws_security_group.default.id
  type = "ingress"
}

resource "aws_security_group_rule" "egress_all" {
  from_port = "0"
  to_port = "0"
  protocol = "-1"
  security_group_id = aws_security_group.default.id
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}
