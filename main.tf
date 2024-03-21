/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
}

provider "aws" {
  region  = "${var.region}"
}

terraform {
  backend "s3" {
  }
}

module "networking" {
  source               = "./modules/networking"
  prefix          = "appointment"
  vpc_cidr             = "10.0.0.0/16"
  public_subnets_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidr = ["10.0.10.0/24", "10.0.20.0/24"]
  region               = "${var.region}"
  availability_zones   = "${local.production_availability_zones}"
  key_name             = "production_key"
}

module "rds" {
  source            = "./modules/rds"
  prefix       = "appointment"
  allocated_storage = "10"
  database_name     = "${var.database_name}"
  database_username = "${var.database_username}"
  database_password = "${var.database_password}"
  subnet_ids        = module.networking.public_subnets_id
  vpc_id            = "${module.networking.vpc_id}"
  instance_class    = "db.t2.micro"
  depends_on = [
    module.networking
  ]
}

module dynamo {
  dynamodb_name = "${var.dynamodb_name}"
  source = "./modules/dynamo"
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source              = "./modules/ecs"
  prefix              = "appointment"
  vpc_id              = "${module.networking.vpc_id}"
  availability_zones  = "${local.production_availability_zones}"
  subnets_ids         = module.networking.private_subnets_id
  public_subnet_ids   = module.networking.public_subnets_id
  security_groups_ids = [
    module.networking.security_groups_ids,
    module.rds.db_access_sg_id
  ]
  ecr_url             = "${module.ecr.ecr_url}"
  database_endpoint   = "${module.rds.rds_address}"
  database_name       = "${var.database_name}"
  database_username   = "${var.database_username}"
  database_password   = "${var.database_password}"
  session_token_aws   = "${var.session_token_aws}"
  access_key_aws      = "${var.access_key_aws}"
  secret_aws          = "${var.secret_aws}"
  dbhost              = "${module.rds.rds_address}"
  execution_arn_role  = "${var.lab_role_arn}"
  rds_id              = "${module.rds.rds_id}"
  secret_key_jwt_token = "${var.secret_key_jwt_token}"
  dynamodb_name        = "${var.dynamodb_name}"
  depends_on = [
    module.rds,
    module.dynamo,
    module.networking
  ]
}
