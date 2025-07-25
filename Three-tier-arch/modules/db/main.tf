# Security group for RDS - allows inbound only from app security group (passed as variable)

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Allow DB access only from app tier"
  vpc_id      = var.vpc_id

  ingress {
    description      = "MySQL from app tier"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [var.app_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Subnet group for RDS using private subnets

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "db_instance" {
  allocated_storage    = var.db_allocated_storage
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  skip_final_snapshot  = true
  publicly_accessible  = false
  multi_az             = false
}
