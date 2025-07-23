resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
}

# Public Subnets
resource "aws_subnet" "public_subnets"{
    count = length(var.public_subnets)
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id  
}

resource "aws_route_table" "pub_rts" {
    vpc_id = aws_vpc.myvpc.id 

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    } 
}

resource "aws_route_table_association" "public_assoc" {
    count = length(aws_subnet.public_subnets)
    subnet_id = aws_subnet.public_subnets[count.index].id
    route_table_id = aws_route_table.pub_rts.id
}

# Private Subnets
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
}