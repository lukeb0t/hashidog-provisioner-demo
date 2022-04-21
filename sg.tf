resource "aws_security_group" "sg1" {
  name   = "sg-external"
  vpc_id = local.vpc_id
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