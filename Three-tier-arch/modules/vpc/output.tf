output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "public_subnets" {
  value = aws_subnet.public_subnets[*].id

}

output "private_subnets" {
  value = aws_subnet.private_subnets[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}