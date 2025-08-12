terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "my-tf-zyq-state-file-bucket"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf_locking_table"
    encrypt        = true
  }
}

provider "aws" {
  # Configuration options for the AWS provider (e.g., region)
  region = "us-east-1"
}