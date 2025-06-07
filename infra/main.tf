module "app_node" {
  source = "./modules/app"

  name = "devops-challenge"
  aws_region = "us-west-2"
  container_image = "411053069660.dkr.ecr.us-west-2.amazonaws.com/devops-challenge:1.0.0"

  execution_role_arn = "arn:aws:iam::411053069660:role/devops-challenge-ecs-task-role"
}