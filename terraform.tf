# ./terraform.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  shared_credentials_files = ["credentials.txt"]
  profile = "customprofile"
  region = var.aws_region
}




variable "aws_region" {
  type = string
}

variable "domain_name" {
  type = string
}







module "website" {
  source = "./.deploy/terraform/static-site"
  domain_name = var.domain_name
}
