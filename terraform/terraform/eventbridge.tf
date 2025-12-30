resource "aws_cloudwatch_event_rule" "event_rule" {
  name = "tf-data-ingestion-rule"

  event_pattern = jsonencode({
    source = ["custom.data.ingestion"]
  })
}

resource "aws_cloudwatch_event_target" "sqs_target" {
  rule = aws_cloudwatch_event_rule.event_rule.name
  arn  = aws_sqs_queue.main.arn
}
