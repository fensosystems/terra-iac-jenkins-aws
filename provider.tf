terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "tf-bucket-for-jenkins-line"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = "tf_locking_table"
    encrypt        = true
  }
}

provider "aws" {
  # Configuration options for the AWS provider (e.g., region)
  region = "us-east-1"
}