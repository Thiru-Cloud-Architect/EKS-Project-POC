module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16" # sample for demonstration - Update with your IP CIDR

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"] # sample for demonstration - Update with your IP CIDR
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"] # sample for demonstration - Update with your IP CIDR

  enable_dns_hostnames = true
  enable_dns_support   = true
}