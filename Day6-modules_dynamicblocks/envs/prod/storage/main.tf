resource "aws_s3_bucket" "prod_bucket" {
  bucket = var.bucket_name
}
