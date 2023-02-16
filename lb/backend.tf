terraform {
  backend "s3" {
    bucket  = "my-remote-bucket-us-west-2"
    key     = "infrastructure/us-west-2/terraform.tfstate"
    region  = "us-west-2"
    profile = "Vscode"
    #dynamodb_table = "devopscodesacademy-tf-locks"
  }
} 