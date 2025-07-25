resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
}

# Public Subnets for fronted layer
resource "aws_subnet" "public_subnets"{
    count = length(var.public_subnets)
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id  
}

# Public Route Table
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

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway in public subnet[0]
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id
  depends_on    = [aws_internet_gateway.igw]
}


# Private Subnets for app and db layers
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
}

# Private Route Table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(aws_subnet.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
