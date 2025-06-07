# ECS Fargate Service
resource "aws_ecs_service" "service" {
  name            = var.name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count
  network_configuration {
    # subnets          = [aws_subnet.public_subnet.id] //TODO: must be private
    subnets          = [aws_subnet.private_subnet.id]
    security_groups  = [aws_security_group.ecs_task_sg.id]
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_app_tg.arn
    container_name   = var.name
    container_port   = var.container_port
  }
  depends_on = [aws_ecs_task_definition.task]
}
