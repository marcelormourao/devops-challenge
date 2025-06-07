resource "aws_lb_target_group" "ecs_app_tg" {
  name        = "${var.name}-tg"
  port        = var.container_port # The port the container exposes
  protocol    = "HTTP"             # Protocol for ALB to task communication
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip" # ESSENTIAL for Fargate tasks

  health_check {
    path                = "/" # Or your specific health check endpoint (e.g., /health)
    protocol            = "HTTP"
    port                = "traffic-port" # Use the port defined above
    interval            = 30             # seconds
    timeout             = 5              # seconds
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200" # HTTP status code for healthy
  }

  tags = {
    Name        = "${var.name}-tg"
    Environment = var.environment
  }
}