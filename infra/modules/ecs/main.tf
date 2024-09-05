resource "aws_ecs_cluster" "this" {
    name = "${var.project_name}-cluster"
}

data "template_file" "hello_zurich_app" {
    template = file("../../modules/ecs/hello-zurich-app.json.tpl")

    vars = {
        app_image      = var.app_image
        app_port       = var.app_port
        fargate_cpu    = var.fargate_cpu
        fargate_memory = var.fargate_memory
        aws_region     = var.aws_region
    }
}

resource "aws_ecs_task_definition" "this" {
    family                   = "${var.project_name}-app-task"
    execution_role_arn       = var.execution_role_arn
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = var.fargate_cpu
    memory                   = var.fargate_memory
    container_definitions    = data.template_file.hello_zurich_app.rendered

    runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

resource "aws_ecs_service" "this" {
    name            = "${var.project_name}-service"
    cluster         = aws_ecs_cluster.this.id
    task_definition = aws_ecs_task_definition.this.arn
    desired_count   = var.app_count
    launch_type     = "FARGATE"

    network_configuration {
        security_groups  = var.security_group_ids
        subnets          = var.subnet_ids
        assign_public_ip = true
    }

    load_balancer {
        target_group_arn = var.target_group_arn
        container_name   = "${var.project_name}-app"
        container_port   = var.app_port
    }
}