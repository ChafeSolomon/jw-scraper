terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws"{
  region = "us-east-1"
}

resource "aws_ecr_repository" "wol" {
  name                 = "jw-web-scraper"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  provisioner "local-exec" {
    command = <<EOT
      aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${var.account_number}.dkr.ecr.us-east-1.amazonaws.com
      docker tag jw-scraper:latest ${var.account_number}.dkr.ecr.us-east-1.amazonaws.com/jw-web-scraper:latest
      docker push ${var.account_number}.dkr.ecr.us-east-1.amazonaws.com/jw-web-scraper:latest
    EOT
  }
}
