terraform {
  backend "s3" {
    bucket       = "dev.devops.30"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-2"
    use_lockfile = true
  }
}
