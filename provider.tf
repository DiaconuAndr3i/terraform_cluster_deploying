terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = var.bucket
    key            = "tf-infra/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = var.dynamodb_table
    encrypt        = true
  }

}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-north-1"
  access_key = var.access_key
  secret_key = var.secret_key
}