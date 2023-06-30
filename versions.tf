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
      version = ">= 0.0.3"
    }
    http = {
      source = "hashicorp/http"
      version = "3.4.0"
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