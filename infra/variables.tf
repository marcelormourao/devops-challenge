variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "environment" {
  description = "The environment name (e.g., dev, staging, production)."
  type        = string
  default     = "dev"
}