output "app_instance_id" {
  description = "The ID of the App EC2 instance"
  value       = aws_instance.app_server.id
}

output "app_security_group_id" {
  description = "Security group ID for the App tier"
  value       = aws_security_group.app_sg.id
}
