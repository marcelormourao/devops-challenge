resource "aws_security_group" "ecs_task_sg" {
  name        = "${var.name}-ecs-task-sg"
  description = "Security group for ECS Fargate tasks in ${var.name} service"
  vpc_id      = aws_vpc.vpc.id

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

resource "aws_security_group_rule" "ingress_from_alb" {
  type                     = "ingress"
  from_port                = var.container_port
  to_port                  = var.container_port
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb_sg.id
  security_group_id        = aws_security_group.ecs_task_sg.id
  description              = "Allow HTTP from internet"
}