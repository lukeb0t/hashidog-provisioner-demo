data "aws_availability_zones" "azs" {
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "hashidog-vpc"
  cidr = "10.0.0.0/16"

  azs             = [data.aws_availability_zones.azs.names]
  private_subnets = var.private_sub_cidrs
  public_subnets  = var.public_sub_cidrs

  enable_nat_gateway = true
  enable_vpn_gateway = true
}

resource "aws_security_group" "hashidog" {
  name   = "sg-external"
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