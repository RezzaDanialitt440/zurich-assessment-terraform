variable "project_name" {
    description = "Name of the project"
}

variable "family" {
    description = "A unique name for your task definition "
}

variable "app_image" {
    description = "Docker image to run in the ECS cluster"
    default = "alsoft27/helloworlddocker:latest"
}

variable "app_port" {
    description = "Port exposed by the docker image to redirect traffic to"
    default = 3000

}

variable "fargate_cpu" {
    description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
    default = "1024"
}

variable "fargate_memory" {
    description = "Fargate instance memory to provision (in MiB)"
    default = "2048"
}

variable "aws_region" {
    description = "The AWS region things are created in"
    type = string
}

variable "app_count" {
    description = "Number of docker containers to run"
    default = 3
}

variable "execution_role_arn" {
    description = "ECS task execution role"
    type = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the Target Group"
  type        = string
}


