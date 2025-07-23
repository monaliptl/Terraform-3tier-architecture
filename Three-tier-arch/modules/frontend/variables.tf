variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for EC2"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Private subnet ID for app EC2"
  type        = string
}

variable "subnets" {
  type = list(string)
}

