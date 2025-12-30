# IAM role for EventBridge Scheduler
resource "aws_iam_role" "scheduler_role" {
  name = "tf-scheduler-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "scheduler.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# Allow scheduler to invoke Lambda
resource "aws_iam_role_policy_attachment" "scheduler_lambda" {
  role       = aws_iam_role.scheduler_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

# Daily schedule
resource "aws_scheduler_schedule" "daily" {
  name = "tf-daily-schedule"

  schedule_expression = "cron(30 3 * * ? *)"

  target {
    arn      = aws_lambda_function.daily_report.arn
    role_arn = aws_iam_role.scheduler_role.arn
  }

  flexible_time_window {
    mode = "OFF"
  }
}

