# -------------------------
# Dead Letter Queue (DLQ)
# -------------------------
resource "aws_sqs_queue" "data_dlq" {
  name = "event-data-dlq"
}

# -------------------------
# Main SQS Queue
# -------------------------
resource "aws_sqs_queue" "data_queue" {
  name                       = "event-data-queue"
  visibility_timeout_seconds = 60

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.data_dlq.arn
    maxReceiveCount     = 5
  })
}
