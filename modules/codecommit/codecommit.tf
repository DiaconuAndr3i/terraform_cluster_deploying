resource "aws_codecommit_repository" "codecommit-repo" {
  repository_name = var.codecommit_repo_name
  description     = "This is the Sample App Repository"
}