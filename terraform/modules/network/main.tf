module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "mdgtask"
  cidr = var.cidr_block

  azs             = var.availability_zones
  public_subnets  = ["10.10.1.0/24", "10.10.2.0/24"]
  private_subnets = ["10.10.3.0/24", "10.10.4.0/24"]

  enable_nat_gateway = true

  tags = {
    Name = "mdgtask"
  }
}