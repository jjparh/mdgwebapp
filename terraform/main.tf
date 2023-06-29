terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0.0"
    }
  }
}

provider "aws" {
  region            = "eu-west-2"
  access_key        = var.access_key
  secret_key        = var.secret_key 
}

terraform {
  backend "s3" {
    bucket = "mdgtask"
    key    = "mdgtask/terraform/remote/s3/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "mdgtaskdynamodb"
  }
}

module "network" {
  source = "./modules/network"

  availability_zones = var.availability_zones
  cidr_block         = var.cidr_block
}

module "security" {
  source = "./modules/security"

  vpc_id         = module.network.vpc_id
  workstation_ip = var.workstation_ip

  depends_on = [
    module.network
  ]
}

module "ec2" {
  source = "./modules/ec2"

  instance_type = var.mdgtask_instance_type
  key_name      = var.key_name
  subnet_id     = module.network.public_subnets[0]
  sg_id         = module.security.mdgtask_sg_id

  depends_on = [
    module.network,
    module.security
  ]
}


