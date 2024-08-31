terraform {
  backend "s3" {
    bucket                 = "zurich-assessment-tfstate"
    key                    = "dev/terraform.tfstate"
    region                 = "ap-southeast-5"
    dynamodb_table         = "zurich-assessment-tfstate-locks"
    skip_region_validation = true
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"

  cidr_block = "172.17.0.0/16"
}

module "alb" {
  source = "../../modules/alb"

  alb_name           = "${var.project_name}-alb"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnet_ids
  target_group_name  = "${var.project_name}-tg"
  security_group_ids = [module.security.alb_sg]
}

module "iam" {
  source = "../../modules/iam"

}

module "ecs" {
  source = "../../modules/ecs"

  aws_region         = var.region
  project_name       = var.project_name
  execution_role_arn = module.iam.ecs_iam_execution_role
  family             = "${var.project_name}-app-task"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = []
  target_group_arn   = module.alb.target_group_arn

  depends_on = [module.alb.alb_listener, module.iam.ecs_iam_execution_role]
}

module "security" {
  source       = "../../modules/security"
  vpc_id       = module.vpc.vpc_id
  app_port     = 80
  project_name = var.project_name

}



