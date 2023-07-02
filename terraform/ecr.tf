resource "aws_ecr_repository" "interview_ecs_app" {
  name                 = var.aws_ecr_repository
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    "env" = var.environment
  }
}