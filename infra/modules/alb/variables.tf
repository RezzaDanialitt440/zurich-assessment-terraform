variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the Target Group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "health_check_path" {
  default = "/"
}

variable "target_group_port" {
  description = "Port number to connect to the target group"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol to connect to the target group"
  type        = string
  default = "HTTP"
}

variable "target_group_type" {
  description = "Target type to connect to the target group"
  type        = string
  default = "ip"
}

variable "app_port" {
  description = "Application port number to connect from the target group"
  type        = number
  default     = 80
}

variable "application_protocol" {
  description = "Application protocol to connect from the target group"
  type        = string
  default = "HTTP"
}

variable "alb_listener_action_type" {
  description = "ALB listener action to route traffice to the target group"
  type        = string
  default = "forward"
}