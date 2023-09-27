terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "5.10.0"
    }
    rhcs = {
      source = "terraform-redhat/rhcs"
      # version = "1.2.2"
      version = "1.3.0-prerelease.1"
    }
  }
}

provider "rhcs" {
  # Configuration options
  token = var.token
  url   = var.url
}

provider "aws" {
  region = var.cloud_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

### random name
resource "random_pet" "prefix" {
  length = 2
}
