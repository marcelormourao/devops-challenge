# main.tf (or a dedicated alb.tf file)

resource "aws_lb" "application_load_balancer" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  # The ALB should reside in public subnets if it's internet-facing
  subnets            = [aws_subnet.public_subnet.id]
  security_groups    = [aws_security_group.alb_sg.id] # Reference a security group for the ALB

  enable_deletion_protection = false # Set to true in production

  tags = {
    Name        = "${var.name}-alb"
    Environment = var.environment
  }
}