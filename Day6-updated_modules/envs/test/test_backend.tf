terraform {
  backend "s3" {
    bucket       = "test.devops.30"
    key          = "test/terraform.tfstate"
    region       = "ap-south-2"
    use_lockfile = true
  }
}
