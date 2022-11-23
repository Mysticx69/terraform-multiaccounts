locals {
  region                     = "us-east-1"
  staging_availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]
}

module "vpc" {
  source = "git::https://github.com/Mysticx69/terraform-aws-vpc.git?ref=v1.0.2"

  # insert required variables here
  environment          = "staging"
  vpc_cidr             = "10.150.0.0/16"
  public_subnets_cidr  = ["10.150.1.0/24", "10.150.2.0/24"]
  private_subnets_cidr = ["10.150.10.0/24", "10.150.20.0/24"]
  availability_zones   = local.staging_availability_zones

  tags = {
    DeployedBy = "Terraform"
    Author     = "Antoine Sterna"
  }
}
