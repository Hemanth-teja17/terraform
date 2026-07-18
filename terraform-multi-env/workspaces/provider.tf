terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }

  backend "s3" {
  bucket = "dnp-project-remote"
  key    = "workspace-dnp"
  region = "us-east-1"
  dynamodb_table = "DNP-locking"
 }
}

 provider "aws" {
  # Configuration options
  region = "us-east-1"
 }
  


#chatgpt create s3bucket and dynamodb from terraform

# resource "aws_s3_bucket" "workspace" {
#   bucket = "dnpp-project-remote"
# }

# resource "aws_dynamodb_table" "tf_lock" {
#   name         = "DNP-locking"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }