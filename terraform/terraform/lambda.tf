resource "aws_lambda_function" "daily_report" {
  function_name = "daily-report-generator"
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.10"

  handler = "lambda_function.lambda_handler"

  filename         = "../lambda/lambda.zip"
  source_code_hash = filebase64sha256("../lambda/lambda.zip")
}

