resource "aws_lambda_function" "daily_report" {
  function_name = "daily-report-generator"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"

  filename = "lambda.zip"  # reference only
}
