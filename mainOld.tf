
provider "aws" {
  region = var.region
}

# resource "aws_s3_bucket" "s3" {
#   bucket = var.bucket_name
# }

# resource "aws_s3_bucket" "s3" {
#   bucket = var.bucket_name
# }


# resource "aws_sqs_queue" "queue" {
#   name = var.queue_name
# }

# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.s3.id

#   queue {
#     queue_arn     = aws_sqs_queue.queue.arn
#     events        = ["s3:ObjectCreated:*"]
#   }
# }

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

resource "aws_sqs_queue" "queue" {
  name = var.queue_name
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id

  queue {
    queue_arn     = aws_sqs_queue.queue.arn
    events        = ["s3:ObjectCreated:*"]
  }
}


data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda_function_payload.zip"
}

# resource "aws_lambda_function" "lambda" {
#   filename      = data.archive_file.lambda_zip.output_path
#   function_name = var.lambda_function_name
#   role          = aws_iam_role.iam_for_lambda.arn
#   handler       = "lambda.test"

#   source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

#   runtime = "nodejs12.x"
# }

# resource "aws_lambda_event_source_mapping" "event_source_mapping" {
#   event_source_arn  = aws_sqs_queue.queue.arn
#   function_name     = aws_lambda_function.lambda.function_name
# }

# resource "aws_sns_topic" "sns" {
#   name = var.sns_topic_name
# }

# resource "aws_lambda_permission" "with_sns" {
#   statement_id  = "AllowExecutionFromSNS"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.lambda.function_name
#   principal     = "sns.amazonaws.com"
#   source_arn    = aws_sns_topic.sns.arn
# }

# resource "aws_sns_topic_subscription" "lambda_subscription" {
#   topic_arn = aws_sns_topic.sns.arn
#   protocol  = "lambda"
#   endpoint  = aws_lambda_function.lambda.arn
# }

