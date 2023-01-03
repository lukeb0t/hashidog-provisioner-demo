data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "hashidog-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.azs.names
  private_subnets = cidrsubnets("10.0.100.0/20", 4, 4, 4)
  public_subnets  = cidrsubnets("10.0.200.0/20", 4, 4, 4)

  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true
}

resource "aws_security_group" "hashidog" {
  name   = "hashidog"
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}