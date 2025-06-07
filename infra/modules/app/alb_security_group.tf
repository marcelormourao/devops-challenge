# main.tf (or a dedicated security_groups.tf file)

resource "aws_security_group" "alb_sg" {
  name        = "${var.name}-alb-sg"
  description = "Security group for the ALB"
  vpc_id      = aws_vpc.vpc.id

  # Ingress: Allow HTTP traffic from anywhere
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access from the internet"
  }

  egress {
    from_port       = var.container_port # Port your containers listen on
    to_port         = var.container_port
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_task_sg.id] # Allow traffic to ECS tasks
    description     = "Allow ALB to reach ECS tasks"
  }

  # Also allow outbound for general communication (e.g., health checks to self)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic from ALB"
  }

  tags = {
    Name        = "${var.name}-alb-sg"
    Environment = var.environment
  }
}