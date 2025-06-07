variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "192.168.0.0/16"
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, production)."
  type        = string
  default     = "dev"
}

variable "name" {
  description = "Name for ECS resources (cluster, service, etc.)"
  type        = string
}

variable "container_image" {
  description = "Docker image URI for the ECS task."
  type        = string
}

variable "container_port" {
  description = "Port the container listens on."
  type        = number
  default     = 3000
}

# variable "subnet_ids" {
#   description = "List of private subnet IDs for ECS tasks."
#   type        = list(string)
# }

# variable "security_group_ids" {
#   description = "List of security group IDs for the ECS service."
#   type        = list(string)
# }

variable "desired_count" {
  description = "Number of ECS tasks to run."
  type        = number
  default     = 1
}

variable "cpu" {
  description = "CPU units for the ECS task."
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memory (in MiB) for the ECS task."
  type        = number
  default     = 512
}

variable "task_role_arn" {
  description = "IAM role ARN for the ECS task."
  type        = string
  default     = null
}

variable "execution_role_arn" {
  description = "IAM role ARN for ECS task execution."
  type        = string
}

# variable "target_group_arn" {
#   description = "ARN of the ALB target group for the ECS service."
#   type        = string
# }

variable "aws_region" {
  description = "AWS region for resources/logs."
  type        = string
}

