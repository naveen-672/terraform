terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.40.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-2"
  alias  = "hyd_region"
}
