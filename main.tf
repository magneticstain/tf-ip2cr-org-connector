terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {}
}

provider "aws" {
  region  = "us-east-1"
}

module "ip2cr-org-connector" {
    source = "./modules/ip2cr-org-connector"
    ip2cr_xaccount_name = var.ip2cr_xaccount_name
    ip2cr_xaccount_assume_role_policy = var.ip2cr_xaccount_assume_role_policy
}
