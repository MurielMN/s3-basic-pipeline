output "bucket_id" {
 value =aws_s3_bucket.bucket.id
}

output "queue_arn" {
  value = aws_sqs_queue.queue.arn
}

output "lambda_function_name" {
  value = "test"
}

output "sns_topic_arn" {
  value = var.sns_topic_name
}

