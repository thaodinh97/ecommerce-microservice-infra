module "vpc" {
  source = "../../modules/vpc"

  name            = "dev-vpc"
  cidr_block      = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.5.0/24"]
}

module "iam" {
  source = "../../modules/iam"
  name   = "dev"
}

module "eks" {
  source = "../../modules/eks"

  cluster_name     = "dev-eks"
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  subnet_ids       = module.vpc.private_subnets
}