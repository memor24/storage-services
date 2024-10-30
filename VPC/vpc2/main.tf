module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "5.14.0"

  name               = "vpc2"
  cidr               = "10.0.0.0/16"
  azs                = ["us-west-2a", "us-west-2b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true

  tags = {
    Environment = "dev"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}