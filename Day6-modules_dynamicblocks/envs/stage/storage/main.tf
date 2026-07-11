resource "aws_s3_bucket" "stage_bucket" {
  bucket = var.bucket_name
}
