module "mywebsite" {
  source      = "../s3-static-website"
  endpoint    = "bigstuff.cornell.edu"
  domain_name = "bigstuff.cornell.edu"
  region      = var.region
  bucket_name = "website"
}