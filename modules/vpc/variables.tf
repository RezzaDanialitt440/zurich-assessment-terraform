variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "az_count" {
    description = "Number of AZs to cover in a given region"
    default = "2"
}
