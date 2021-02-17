# NETWORK CONFIGURATION
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.env_name}-vpc"
  cidr = var.vpc_net

  azs             = var.zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.env_name}-eks" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.env_name}-eks" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
    Security    = "Neuvector"
  }
}

# CLUSTER EKS CONFIGURATION
module "my-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "${var.env_name}-eks"
  cluster_version = "1.17"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type = var.machine_type
      asg_max_size  = var.asg_max
    }
  ]

  workers_group_defaults = {
  	root_volume_type = "gp2"
  }
  
  depends_on = [module.vpc]
}

data "aws_eks_cluster" "cluster" {
  name = module.my-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.my-cluster.cluster_id
}