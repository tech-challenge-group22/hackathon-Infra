output "ecr_url" {
  value = "${aws_ecr_repository.appointment_app.repository_url}"
}