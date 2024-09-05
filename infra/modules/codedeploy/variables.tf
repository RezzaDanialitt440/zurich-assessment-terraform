variable "application_name" {
  description = "The name of the CodeDeploy application"
  type        = string
}

variable "deployment_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "target_group_name" {
  description = "The name of the target group associated with the ECS service"
  type        = string
}
