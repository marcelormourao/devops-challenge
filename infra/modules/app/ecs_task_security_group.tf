resource "aws_security_group" "ecs_task_sg" {
  name        = "${var.name}-ecs-task-sg"
  description = "Security group for ECS Fargate tasks in ${var.name} service"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow HTTP/TCP from ALB"
    from_port       = var.container_port
    to_port         = var.container_port
    protocol        = "tcp"
    # security_groups = [var.alb_security_group_id]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name}-ecs-task-sg"
    Environment = var.environment
  }
}