terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
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