terraform {
  backend "s3" {
    bucket  = "BKT-github-infra"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }

  required_version = ">= 1.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.7.5"
    }

  }
}