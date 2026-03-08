terraform {
  required_version = ">= 1.4.0"
  backend "s3" {
    bucket         = "tapari09081998"  # S3 bucket name
    key            = "terraform.tfstate"  # path inside bucket
    region         = "us-east-1"
    encrypt        = true  # encrypt state at rest
    dynamodb_table = "terraform-locks"  # optional table for state locking
  }
}
