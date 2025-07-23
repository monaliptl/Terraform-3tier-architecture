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

