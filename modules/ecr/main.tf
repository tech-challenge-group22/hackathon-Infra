/*====
ECR repository to store our Docker images
======*/
resource "aws_ecr_repository" "appointment_app" {
  name = "appointment/production"
}