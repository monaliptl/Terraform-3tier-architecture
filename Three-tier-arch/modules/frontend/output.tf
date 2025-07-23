output "instance_id" {
  description = "The ID of the frontend EC2 instance"
  value       = aws_instance.frontend_web.id
}

output "security_group_id" {
  description = "The security group ID for frontend"
  value       = aws_security_group.frontend_sg.id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.frontend_alb.dns_name
}
