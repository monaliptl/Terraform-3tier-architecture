module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  
}

module "frontend" {
  source         = "./modules/frontend"
  vpc_id         = module.vpc.vpc_id
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnets[0]
  subnets        = module.vpc.public_subnets
  key_name       = var.key_name
}

module "app" {
  source                    = "./modules/app"
  vpc_id                    = module.vpc.vpc_id
  subnet_id                 = module.vpc.private_subnets[0]
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  allowed_security_group_id = module.frontend.security_group_id
}

module "db" {
  source                = "./modules/db"
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnets
  db_username           = var.db_username
  db_password           = var.db_password
  app_security_group_id = module.app.app_security_group_id # <- Output from app module
  db_instance_class     = var.db_instance_class    # Passed from root variables
  db_allocated_storage  = var.db_allocated_storage
  db_engine             = var.db_engine
  db_engine_version     = var.db_engine_version
}


