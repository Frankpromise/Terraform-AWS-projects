variable "sns_topic_name" {
  description = "SNS Topic Name"
  type        = string
  default     = "s3-topic"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  type        = string
  default     = "sns-s3-bucket-1"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to add to resources"
}

variable "aws_region" {
  default = "us-west-1"
}

variable "profile" {
  default = "your-profile-name-here"
}

variable "email_address" {
  default = "your-email-here"
}