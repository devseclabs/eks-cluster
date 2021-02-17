provider "aws" {
  version = ">= 3.3.0"
  region = var.region
  profile = var.profile
}

terraform {
  required_version = ">= 0.13"
}

provider "kubernetes" {
  version = "~> 1.13.3"
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}