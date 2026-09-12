provider "aws" {
  region = "ap-south-2"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "test.devops.30"
}

resource "aws_s3_bucket_versioning" "test_versioning" {
  bucket = aws_s3_bucket.test_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
