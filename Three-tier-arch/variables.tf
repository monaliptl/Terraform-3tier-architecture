variable "vpc_cidr" {
    description = "cidr value for VPC"
    type = string
  
}
variable "public_subnets" {
    description = "range of public subnet"
    type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "availability_zones" {
    description = "define availability zones"
    type = list(string)
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

variable "db_username" {
    description = "define username"
    type = string
  
}

variable "db_password" {
    description = "define password"
    type = string
  
}

variable "db_instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}