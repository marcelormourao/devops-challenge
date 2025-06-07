resource "aws_cloudwatch_metric_alarm" "ecs_cpu_utilization_high" {
  alarm_name          = "${var.name}-cpu-utilization-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 300 # 5 minutes (in seconds)
  statistic           = "Average"
  threshold           = 70 # 70% CPU Utilization
  alarm_description   = "Alarm when ECS service CPU utilization is above 70%"

  dimensions = {
    ClusterName = var.name
    ServiceName = var.name
  }

  unit = "Percent"

  # Optional: Configure actions to take when the alarm state changes
  alarm_actions = [aws_sns_topic.alarm_notifications.arn]
  # ok_actions    = [aws_sns_topic.alarm_notifications.arn]
}