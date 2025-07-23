output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "frontend_instance_id" {
  description = "ID of the frontend web server EC2 instance"
  value       = module.frontend.instance_id
}

output "alb_dns_name" {
  description = "DNS of the Application Load Balancer"
  value       = module.frontend.alb_dns_name
}

output "app_instance_id" {
  value = module.app.app_instance_id
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.db.rds_endpoint
}

output "rds_identifier" {
  description = "RDS instance identifier"
  value       = module.db.rds_identifier
}
