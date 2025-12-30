resource "aws_sqs_queue" "dlq" {
  name = "tf-event-data-dlq"
}

resource "aws_sqs_queue" "main" {
  name                      = "tf-event-data-queue"
  visibility_timeout_seconds = 60

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 5
  })
}
