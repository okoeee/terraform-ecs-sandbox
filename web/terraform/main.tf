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
  subnet_public_id_a = module.network.subnet_public_id_a
  subnet_public_id_c = module.network.subnet_public_id_c
  sg_id = module.security.security_group_id
  vpc_id = module.network.vpc_id
}

# IAM
module "iam" {
  source = "./modules/iam"

  name_prefix = var.name_prefix
}

# ECR
module "ecr" {
  source = "./modules/ecr"

  name_prefix = var.name_prefix
}

# ECS
module "ecs" {
  source = "./modules/ecs"

  region = var.region
  name_prefix = var.name_prefix
  web_app_port = var.web_app_port

  ecr_repository_uri = module.ecr.repository_uri
  execution_role_arn = module.iam.ecs_execution_role_arn

  logs_group_name = module.cloudwatch.logs_group_name
  target_group_arn = module.alb.target_arn

  subnet_public_id_a = module.network.subnet_public_id_a
  subnet_public_id_c = module.network.subnet_public_id_c
  security_group_id = module.security.security_group_id
}
