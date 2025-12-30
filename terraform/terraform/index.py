def lambda_handler(event, context):
    print("Hello from Terraform Lambda")
    return {
        "statusCode": 200,
        "body": "Success"
    }

