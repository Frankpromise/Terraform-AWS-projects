terraform {
  backend "s3" {
    bucket = "my-remote-bucket-us-west-2"
    key    = "infrastructure/eu-central-1/terraform.tfstate"
    region = "us-west-2"
    #dynamodb_table = "devopscodesacademy-tf-locks"
  }
}