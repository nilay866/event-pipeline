resource "aws_scheduler_schedule" "daily" {
  name = "tf-daily-schedule"

  schedule_expression = "cron(30 3 * * ? *)"

  target {
    arn      = aws_lambda_function.email_lambda.arn
    role_arn = aws_iam_role.lambda_role.arn
  }

  flexible_time_window {
    mode = "OFF"
  }
}
