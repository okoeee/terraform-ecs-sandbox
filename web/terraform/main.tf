# Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.72.0"
    }
  }
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

# Network
module "network" {
  source = "./modules/network"

  name_prefix = var.name_prefix
}

# Security Group
module "security" {
  source = "./modules/security"

  name_prefix = var.name_prefix
  vpc_id = module.network.vpc_id
}

# CloudWatch
module "cloudwatch" {
  source = "./modules/cloudwatch"

  name_prefix = var.name_prefix
}

# ALB
module "alb" {
  source = "./modules/alb"

  name_prefix = var.name_prefix
  subnet_public_id = module.network.subnet_public_id
  sg_id = module.security.security_group_id
  vpc_id = module.network.vpc_id
}

# IAM
module "iam" {
  source = "./modules/iam"

  name_prefix = var.name_prefix
}
