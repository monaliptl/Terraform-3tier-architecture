variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Private subnet ID for app EC2"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for app EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "allowed_security_group_id" {
  description = "Security group ID allowed to access the app tier (frontend SG)"
  type        = string
}
