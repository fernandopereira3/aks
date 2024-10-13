resource "aws_vpc" "vpc-k8-dio" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "resource-VPC-k8"
    Environment = "Estudos"
  }

}

resource "aws_subnet" "subnet-k8-dio1" {
  vpc_id     = aws_vpc.vpc-k8-dio.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2b"
  
  tags = {
    Name = "resource-aws-subnet1-k8"
    Environment = "Estudos"
  }
}

resource "aws_subnet" "subnet-k8-dio2" {
  vpc_id     = aws_vpc.vpc-k8-dio.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2c"
  
  tags = {
    Name = "resource-aws-subnet2-k8"
    Environment = "Estudos"
  }
}