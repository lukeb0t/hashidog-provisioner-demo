provider "aws" {
  default_tags {
   tags = local.tags
}
region = var.region
}

locals {
  tags = {
    owner              = var.owner
    se-region          = "AMER-East E2",
    purpose            = "Terraform Demo of AWS Ifra-as-code",
    ttl                = var.ttl,
    terraform          = "true",
    hc-internet-facing = "true",
  }
}

