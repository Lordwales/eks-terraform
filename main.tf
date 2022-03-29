# creating VPC
module "VPC" {
  source                              = "./modules/VPC"
  region                              = var.region
  vpc_cidr                            = var.vpc_cidr
  enable_dns_support                  = var.enable_dns_support
  enable_dns_hostnames                = var.enable_dns_hostnames
  enable_classiclink                  = var.enable_classiclink
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  private_subnets                     = [for i in range(1, 8, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  public_subnets                      = [for i in range(2, 5, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

module "security" {
  source = "./modules/Security"
  vpc_id = module.VPC.vpc_id
}

module "EKS" {
  source        = "./modules/EKS"
  private-sbn-1 = module.VPC.private_subnets-1
  private-sbn-2 = module.VPC.private_subnets-2
  # private-subnets = module.VPC.private_subnets
  eks-sg = module.security.sg-eks-cluster
  vpc_id = module.VPC.vpc_id

}