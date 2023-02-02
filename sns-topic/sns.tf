resource "aws_sns_topic" "topic" {
  name              = var.sns_topic_name
  kms_master_key_id = aws_kms_key.topic_key.id
  tags              = var.tags
}

resource "aws_sns_topic_policy" "policy" {
  arn    = aws_sns_topic.topic.arn
  policy = <<POLICY
  {
      "Version":"2012-10-17",
      "Statement":[{
          "Effect": "Allow",
          "Principal": {"Service":"s3.amazonaws.com"},
          "Action": "SNS:Publish",
          "Resource":  "${aws_sns_topic.topic.arn}",
          "Condition":{
              "ArnLike":{"AWS:SourceArn":"${aws_s3_bucket.sns-bucket.arn}"}
          }
      }]
  }
  POLICY
}


resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = "${aws_sns_topic.topic.arn}"
  protocol  = "email"
  endpoint  = var.email_address
  depends_on = [
    aws_sns_topic.topic
  ]
}