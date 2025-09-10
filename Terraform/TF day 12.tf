provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "devops_bucket" {
  bucket = "devops-s3-735"
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "devops_bucket_block" {
  bucket = aws_s3_bucket.devops_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
