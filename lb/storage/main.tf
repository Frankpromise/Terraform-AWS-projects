#-----storage/main.tf

resource "aws_s3_bucket" "b" {
  bucket        = var.bucket_name
  acl           = "log-delivery-write"
  force_destroy = true

  tags = {
    Name = "My bucket"
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.b.id
  policy = data.aws_iam_policy_document.s3_bucket_lb_write.json
}




