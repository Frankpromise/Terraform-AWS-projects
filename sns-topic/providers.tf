# Terraform block

terraform {
  #required_version = "~> 0.14" # any version equal and above 0.14
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider block

provider "aws" {
  region  = var.aws_region
  profile = var.profile
}