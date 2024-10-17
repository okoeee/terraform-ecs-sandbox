
resource "aws_ecr_repository" "default" {
  name = "${local.repository_name}"
  image_tag_mutability = "MUTABLE"
}
