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
    subnet_ids = ["module.vpc.vpc-kubernetes-salao"]
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
  #   aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  # ]
}

# output "endpoint" {
#   value = aws_eks_cluster.example.endpoint
# }

# output "kubeconfig-certificate-authority-data" {
#   value = aws_eks_cluster.example.certificate_authority[0].data
# }