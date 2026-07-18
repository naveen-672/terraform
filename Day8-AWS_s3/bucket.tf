resource "aws_s3_bucket" "mybucket" {
  bucket = each.value
  for_each = toset(local.bucket_names)
}

locals {
    bucket_names = ["reshma-dev.bucket", "reshma-uat.bucket", "reshma-prod.bucket"]
}
