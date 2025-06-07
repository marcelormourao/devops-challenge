resource "aws_sns_topic" "alarm_notifications" {
  name = "${var.name}-alarm-notifications"

  tags = {
    Name        = "${var.name}-alarm-notifications"
    Environment = var.environment
  }
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alarm_notifications.arn
  protocol  = "email"
  endpoint  = var.alarm_email_address
}