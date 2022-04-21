provider "aws" {
  default_tags {
   tags = local.tags
}
region = var.region
}

locals {
  tags = {
    owner              = "George Jetson"
    se-region          = "AMER-East E2",
    purpose            = "training demo for manager and peers",
    ttl                = var.ttl,
    terraform          = "true",
    hc-internet-facing = "true",
  }
}

