provider "aws" {
  region = "ap-south-2"
}

module "test_instance" {
  source      = "../../modules/ec2"
  iname       = "test_instance"
  ami_id      = "ami-0e7534be9ccf49507"
  itype       = "c7i-flex.large"
  key_name    = "hydkp"
  volume_size = 15
}

