# DevOps Challenge: Infrastructure and Application Overview

## Challenge Goal

The core objective of this challenge is to demonstrate the ability to provision and manage a scalable and observable application on AWS. This includes:

- Setting up the necessary network infrastructure (VPC, subnets, gateways).

- Deploying a containerized Node.js application using AWS ECS Fargate.

- Configuring an Application Load Balancer (ALB) for external access.

- Implementing logging and monitoring with CloudWatch.

- Setting up alerting for key application metrics.

The project leverages Infrastructure as Code (IaC) with Terraform to ensure repeatable and consistent deployments.

## AWS Infrastructure and IAM Roles Used
The infrastructure for this challenge is defined using Terraform and includes several AWS components. Each component interacts with others, requiring specific IAM roles and permissions.

Key AWS Components:

- **VPC:** Virtual Private Cloud for isolated network environment, including Public and Private Subnets.

- **Internet Gateway (IGW):** Allows communication between the VPC and the internet.

- **NAT Gateway:** Enables instances in private subnets to connect to the internet (e.g., for ECR pulls, package updates) while preventing inbound connections from the internet.

- **Application Load Balancer (ALB):** Distributes incoming application traffic across multiple targets, providing high availability and fault tolerance. It resides in public subnets.

- **ECS:** Maintains the desired count of tasks, handles deployments, and registers tasks with the ALB.

- **Amazon ECR (Elastic Container Registry):** A fully-managed Docker container registry for storing your application's Docker images.

- **Amazon CloudWatch Logs:** Collects and stores logs from your ECS tasks.

- **Amazon CloudWatch Alarms:** Send logs, monitors metrics (e.g., CPU utilization) and triggers actions (e.g., SNS notifications) when thresholds are breached.

- **Amazon SNS (Simple Notification Service):** A messaging service used to send notifications (e.g., emails) when alarms are triggered.

## Browser output
![Parcial Result](./img/works.png)
**Obs:** Still needs improvements but it works.

## Diagram

![Diagram](./img/diagram.png)

## Requirements
- NodeJS 20.x
- Terraform 1.8.x
- Docker
