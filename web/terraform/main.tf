# Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.72.0"
    }
  }
}

locals {
  app_name                 = "terraform-sandbox"
}

# Provider
provider "aws" {
  profile = "terraform-user"
  region  = "us-east-1"
  default_tags {
    tags = {
      application = local.app_name
    }
  }
}
