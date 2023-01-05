provider "aws" {
  default_tags {
   tags = local.tags
}
  region = var.region
  access_key = data.doormat_aws_credentials.creds.access_key
  secret_key = data.doormat_aws_credentials.creds.secret_key
  token      = data.doormat_aws_credentials.creds.token
}

provider "doormat" {}

data "doormat_aws_credentials" "creds" {
  provider = doormat
  role_arn = "arn:aws:iam::325038557378:role/hashidog-provisioner-demo"
}

locals {
  tags = {
    owner              = var.owner
    se-region          = "AMER-East E2",
    purpose            = "Terraform Demo using provisioners for customization",
    ttl                = var.ttl,
    terraform          = "true",
    hc-internet-facing = "true",
  }
}

