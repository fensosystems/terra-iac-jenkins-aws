    resource "aws_s3_bucket" "my_s3_bucket" {
        bucket = "my-terraform-jenkins-test-buck" # Replace with a globally unique name
        acl    = "private" # Or "public-read", "public-read-write", etc.
        tags = {
            Environment = "Development"
            Project     = "TerraformS3"
        }
    }
