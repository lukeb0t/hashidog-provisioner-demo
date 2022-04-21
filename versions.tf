terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
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