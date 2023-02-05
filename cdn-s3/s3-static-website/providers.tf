
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.44.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
  profile = "Vscode"
}

provider "aws" {
  alias = "us-east-1"
  region = "us-east-1"
  profile = "Vscode"
}


