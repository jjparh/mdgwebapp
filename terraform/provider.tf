terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }
}

provider "aws" {
  #region            = var.aws_region
  #access_key        = var.access_key
  #secret_key        = var.secret_key 
}

terraform {
  backend "s3" {
    bucket = "mdgtask"
    key    = "mdgtask/terraform/remote/mdgwebapp/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "mdgtaskdynamodb"
  }
}

