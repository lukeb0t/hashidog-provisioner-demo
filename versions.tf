terraform {
  required_providers {
      aws = {
      source  = "hashicorp/aws"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.2"
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