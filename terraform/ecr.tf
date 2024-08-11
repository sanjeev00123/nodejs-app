resource "aws_ecr_repository" "my_ecr_repo" {
  name = "node-app"  # Replace with your desired repository name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.my_ecr_repo.repository_url
}

