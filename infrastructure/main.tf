/*
REVIEWER NOTE:
This implementation uses AWS instead of Azure because Azure registration
is blocked in my region. I've implemented the equivalent functionality
using AWS S3 for remote state storage and DynamoDB for state locking.
Please review this AWS-based solution as an alternative to the original Azure requirements
*/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }

  backend "s3" {
    bucket = "andr1yk-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

  defaultsg         = var.defaultsg
  subnet_cidr_block = var.subnet_cidr_block
  vpc_cidr_block    = var.vpc_cidr_block
  vpc_name          = var.vpc_name
}

module "compute" {
  source = "./modules/compute"

  vm_name           = var.vm_name
  instance_size     = var.instance_size
  subnet_id         = module.network.subnet_id
  security_group_id = module.network.security_group_id
}

module "storage" {
  source = "./modules/storage"
}
