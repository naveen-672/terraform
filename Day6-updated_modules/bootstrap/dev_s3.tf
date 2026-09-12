provider "aws" {
  region = "ap-south-2"
}

resource "aws_s3_bucket" "dev_bucket" {
  bucket = "dev.devops.30"
}

resource "aws_s3_bucket_versioning" "dev_versioning" {
  bucket = aws_s3_bucket.dev_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
