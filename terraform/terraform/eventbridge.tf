# -------------------------
# EventBridge Rule
# -------------------------
resource "aws_cloudwatch_event_rule" "data_event_rule" {

  # Name of the rule in AWS
  name = "data-ingestion-rule"

  # Description for clarity
  description = "Capture custom data ingestion events"

  # Event pattern to match incoming events
  event_pattern = jsonencode({
    source = ["custom.data.ingestion"]
  })
}
