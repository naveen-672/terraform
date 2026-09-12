provider "aws" {
  region = "ap-south-2"
}

module "dev_instance" {
  source      = "../../modules/ec2"
  iname       = "dev_instance"
  ami_id      = "ami-0e7534be9ccf49507"
  itype       = "t3.micro"
  key_name    = "hydkp"
  volume_size = 11
}
