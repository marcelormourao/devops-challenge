resource "aws_cloudwatch_log_group" "ecs_task_logs" {
  name              = "/ecs/${var.name}"
  retention_in_days = 3

  tags = {
    Name        = "${var.name}-ecs-logs"
    Environment = var.environment
  }
}