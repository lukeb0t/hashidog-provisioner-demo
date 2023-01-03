terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
    }
    doormat = {
      source  = "doormat.hashicorp.services/hashicorp-security/doormat"
      version = "~> 0.0.0"
    }
}

cloud {
    organization = "argocorp"
    hostname = "app.terraform.io"

    workspaces {
      name = "hashidog-provisioner-demo"
    }
  }
}