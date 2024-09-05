variable "app_port" {
    description = "Port exposed by the docker image to redirect traffic to"
}



variable "security_groups" {
  description = "List of Security Group IDs where the ALB will be deployed"
  type        = list(string)
  default = [ "" ]
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "project_name" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}


