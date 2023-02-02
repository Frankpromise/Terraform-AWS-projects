resource "aws_kms_key" "topic_key" {
  description = "Topic Key"
  policy      = data.aws_iam_policy_document.topic_key_kms_policy.json
  tags        = var.tags
}

data "aws_iam_policy_document" "topic_key_kms_policy" {
  statement {
    effect = "Allow"
    principals {
      identifiers = ["s3.amazonaws.com"]
      type        = "Service"
    }
    actions = [
      "kms:GenerateDataKey",
      "kms:Decrypt"
    ]
    resources = [aws_s3_bucket.sns-bucket.arn]
  }

  statement {
    effect = "Allow"
    principals {
      // Change this to some admin role, for example only
      identifiers = ["*"]
      type        = "AWS"
    }
    actions = [
      "kms:*"
    ]
    resources = ["*"]
  }
}