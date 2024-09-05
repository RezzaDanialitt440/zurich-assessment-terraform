output "ecs_sg" {
  description = "Security Group for ECS task"
  value       = aws_security_group.ecs_tasks.id
}

output "alb_sg" {
  description = "Security Group for ALB"
  value       = aws_security_group.lb.id
}