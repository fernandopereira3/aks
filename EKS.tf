terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.46.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_eks_cluster" "eks-dio" {
  name     = "eks-dio"
  role_arn = aws_iam_role.iam_role_aks.arn

  vpc_config {
    subnet_ids = [ "module.vpc.public_subnets.id" ]
  }

  depends_on = [
    module.vpc
  ]
}
module "vpc"{
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.13.0"
  name = "vpc-kubernetes-estudos"

  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true


  tags = {
    Environment = "Estudos"
  }


}

# output "endpoint" {
#   value = aws_eks_cluster.example.endpoint
# }

# output "kubeconfig-certificate-authority-data" {
#   value = aws_eks_cluster.example.certificate_authority[0].data
# }