resource "aws_alb" "this" {
    name        = var.alb_name
    subnets         = var.subnet_ids
    security_groups = var.security_group_ids
}

resource "aws_alb_target_group" "this" {
    name        = var.target_group_name
    port        = var.target_group_port
    protocol    = var.target_group_protocol
    vpc_id      = var.vpc_id
    target_type = var.target_group_type

    health_check {
        healthy_threshold   = "3"
        interval            = "30"
        protocol            = "HTTP"
        matcher             = "200"
        timeout             = "3"
        path                = var.health_check_path
        unhealthy_threshold = "2"
    }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_alb.this.id
  port              = var.app_port
  protocol          = var.application_protocol

  default_action {
    target_group_arn = aws_alb_target_group.this.id
    type             = var.alb_listener_action_type
  }
}