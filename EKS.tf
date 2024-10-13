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
    subnet_ids = [aws_subnet.subnet-k8-dio1.id, aws_subnet.subnet-k8-dio2.id]
  }


}