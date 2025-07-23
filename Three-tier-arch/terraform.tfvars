
vpc_cidr = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]

instance_type = "t2.micro"
ami_id = "ami-020cba7c55df1f615"
key_name = "awslogin"

db_username = "web_resume"
db_password = "web_resume"
db_instance_class = "db.t3.micro"
db_allocated_storage = 20
db_engine = "mysql"
db_engine_version = "8.0"



