    resource "aws_s3_bucket" "my_s3_bucket" {
        bucket = "my-terraform-jenkins-test-buck" # Replace with a globally unique name
        acl    = "private" # Or "public-read", "public-read-write", etc.
        tags = {
            Environment = "Development"
            Project     = "TerraformS3"
        }
    }

    resource "aws_eip" "example_eip" {
    vpc = true # Set to true if the EIP is for use within a VPC
    # Optional: Associate with an instance or network interface
    # instance = aws_instance.web.id
    # network_interface = aws_network_interface.main.id
    }
