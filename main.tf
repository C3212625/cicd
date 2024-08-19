provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "10.0.0.0/16"
  subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-0a38c1c38a15fed74"
  instance_type     = "t2.micro"
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name
}
