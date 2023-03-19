provider "aws" {
    region = "us-east-1"
    profile = "Vscode"
}

terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}