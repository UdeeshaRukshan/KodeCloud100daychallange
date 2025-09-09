provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "datacenter_bucket" {
  bucket = "datacenter-s3-5555"
}

# Enable public ACL
resource "aws_s3_bucket_acl" "datacenter_bucket_acl" {
  bucket = aws_s3_bucket.datacenter_bucket.id
  acl    = "public-read"
}

# Allow public access (disable AWS account-level block settings for this bucket)
resource "aws_s3_bucket_public_access_block" "datacenter_public_access" {
  bucket = aws_s3_bucket.datacenter_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
