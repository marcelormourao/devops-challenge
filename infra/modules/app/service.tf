# ECS Fargate Service
resource "aws_ecs_service" "service" {
  name            = var.name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count
  network_configuration {
    # subnets          = var.subnet_ids
    subnets          = [aws_subnet.public_subnet.id] //TODO: must be private
    security_groups  = [aws_security_group.ecs_task_sg.id]
    assign_public_ip = true # must be false later
  }
#   load_balancer {
#     # target_group_arn = var.target_group_arn
#     container_name   = var.name
#     container_port   = var.container_port
#   }
  depends_on = [aws_ecs_task_definition.task]
}
