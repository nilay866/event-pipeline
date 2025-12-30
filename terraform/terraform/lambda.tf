resource "aws_lambda_function" "email_lambda" {
  function_name = "tf-daily-report-generator"
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.12"
  handler       = "lambda_function.lambda_handler"

  filename = "lambda.zip"
}
