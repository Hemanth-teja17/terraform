terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }

  backend "s3" {
    bucket = "remote-state-hem-project"
    key    = "remote-state-hem-project-key"
    region = "us-east-1"
    dynamodb_table = "remote-state-hem-project"
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
}
