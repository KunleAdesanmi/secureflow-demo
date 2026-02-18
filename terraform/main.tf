terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" 
}

# 1. Create the ECR Repo (Where we store Docker images)
resource "aws_ecr_repository" "app_repo" {
  name                 = "secureflow-app"
  image_tag_mutability = "MUTABLE"

  # DevSecOps: Enable scanning on push (This is a key interview talking point)
  image_scanning_configuration {
    scan_on_push = true
  }
}

# 2. Output the URL (We need this for GitHub Actions later)
output "ecr_repository_url" {
  value = aws_ecr_repository.app_repo.repository_url
}