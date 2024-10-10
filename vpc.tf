# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "5.13.0"
#   name = "vpc-kubernetes-estudos"

#   cidr = "10.0.0.0/16"

#   azs             = ["us-west-2a"]
#   private_subnets = ["10.0.1.0/24"]
#   public_subnets  = ["10.0.101.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true


#   tags = {
#     Environment = "Estudos"
#   }


# }
resource "aws_vpc" "vpc-k8-dio" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "resource-VPC-k8"
    Environment = "Estudos"
  }

}

resource "aws_subnet" "subnet-k8-dio" {
  vpc_id     = aws_vpc.vpc-k8-dio.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"
  
  tags = {
    Name = "resource-aws-subnet-k8"
    Environment = "Estudos"
  }
}