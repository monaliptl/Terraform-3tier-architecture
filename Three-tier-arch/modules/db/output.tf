output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.db_instance.endpoint
}

output "db_security_group_id" {
  value = aws_security_group.db_sg.id
}

output "rds_identifier" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.db_instance.id
}