resource "aws_s3_bucket" "sns-bucket" {
  bucket = var.bucket_name
  acl    = "private"
  tags   = var.tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_notification" "notif" {
  bucket = aws_s3_bucket.sns-bucket.id

  topic {
    topic_arn = aws_sns_topic.topic.arn

    events = [
      "s3:ObjectCreated:Put",
    ]

  }
}