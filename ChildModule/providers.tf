
terraform {
  required_version = ">=1.1.0"

  backend "s3" {
    bucket         = "ops-environment-network"
    dynamodb_table = "terraform-lock"
    key            = "path/env"
    region         = "us-east-1"
    encrypt        = "true"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  # profile = "default"
  assume_role {
    # role_arn = "arn:aws:iam::056433689356:role/Terraform_Admin_Role"
    role_arn = "arn:aws:iam::${lookup(var.env, terraform.workspace)}:role/Terraform_Admin_Role"
  }

  default_tags {
    tags = local.mandatory_tag
  }

}

variable "env" {
  description = "List of All environment"
  type        = map(string)
  # default = {
  #   "prod"  = "056433689356"
  #   dev     = "260899467279"
  #   sandbox = "818272138189"

  # }
}

