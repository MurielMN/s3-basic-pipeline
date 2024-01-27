variable "region" {
  description = "The region where AWS resources will be created"
  type    = string
  default = "us-west-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type    = string
  default = "cloudvisionbukt"
}

variable "queue_name" {
  description = "The name of the SQS queue"
  type    = string
  default = "cloudvisionbukt"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type    = string
  default = "lambda_function_name"
}

variable "sns_topic_name" {
  description = "The name of the SNS topic"
  type    = string
  default = "sns-topic-name"
}

