# ECS Task Definition
resource "aws_ecs_task_definition" "task" {
  family                   = var.name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  container_definitions    = jsonencode([
    {
      name      = var.name
      image     = var.container_image
      portMappings = [{
        containerPort = var.container_port
        hostPort      = var.container_port
        protocol      = "tcp"
      }]
      essential = true
      # logConfiguration = {
      #   logDriver = "awslogs"
      #   options = {
      #     awslogs-group         = "/ecs/${var.name}"
      #     awslogs-region        = var.aws_region
      #     awslogs-stream-prefix = "ecs"
      #   }
      # }
    }
  ])
}
