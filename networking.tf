data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "hashidog-vpc"
  cidr = "10.0.0.0/16"

  azs             = data.aws_availability_zones.azs.names
  private_subnets = cidrsubnets("10.20.0.0/16", 2, 2, 2, 2, 2, 2, 2)
  public_subnets  = cidrsubnets("10.10.0.0/16", 2, 2, 2, 2, 2, 2, 2)

  enable_nat_gateway = true
  enable_vpn_gateway = true
}

resource "aws_security_group" "hashidog" {
  name   = "hashidog"
  vpc_id = module.vpc.vpc_id
  egress {
    # allow all outbound
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # Allow inbound SSS from anywhere. Using bastion for provisioning. This should be disabled for production
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # allowing gloabl access for UI demo and build. Do not do this in production
    from_port   = 8200
    to_port     = 8205
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}