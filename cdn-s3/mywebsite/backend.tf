terraform {
  backend "s3" {
    bucket = "myremotestate"
    key    = "infrastructure/eu-central-1/terraform.tfstate"
    region = "us-west-2"
    #dynamodb_table = "devopscodesacademy-tf-locks"
  }
}