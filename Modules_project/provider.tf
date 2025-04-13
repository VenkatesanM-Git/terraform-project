terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "remote" {
    hostname     = "venkateanm.scalr.io"
    organization = "venkateanm"

    workspaces {
      name = "modules"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region_output
}