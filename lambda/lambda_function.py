import boto3

ses = boto3.client("sesv2", region_name="ap-south-1")

def lambda_handler(event, context):
    response = ses.send_email(
        FromEmailAddress="nilaychavhan@gmail.com",
        Destination={
            "ToAddresses": ["nilaychavhan@gmail.com"]
        },
        Content={
            "Simple": {
                "Subject": {"Data": "Daily Report"},
                "Body": {
                    "Text": {"Data": "Daily report generated successfully."}
                }
            }
        }
    )
    print("EMAIL SENT", response)
    return {"statusCode": 200}
