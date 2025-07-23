# Security Group for App tier (allow traffic only from frontend SG)
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow traffic only from frontend security group"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow HTTP from frontend SG"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [var.allowed_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance in private subnet (app tier)
resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = var.key_name

  tags = {
    Name = "App-Tier-Server"
  }
}
