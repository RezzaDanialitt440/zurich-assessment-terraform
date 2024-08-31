output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_alb.this.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_alb.this.dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the ALB"
  value       = aws_alb.this.zone_id
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_alb_target_group.this.id
}

output "alb_listener" {
  description = "The listerner of the ALB"
  value       = aws_alb_listener.this.id
}
