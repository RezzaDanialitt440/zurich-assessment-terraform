variable "environment_name" {
  description = "Name of the Enviroment"
  type        = string
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
}

variable "region" {
  description = "Name of the AWS region"
  type        = string
  default     = "ap-southeast-1"
}