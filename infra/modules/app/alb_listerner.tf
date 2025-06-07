resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 3000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_app_tg.arn # Reference the Target Group
  }

  tags = {
    Name        = "${var.name}-http-listener"
    Environment = var.environment
  }
}
