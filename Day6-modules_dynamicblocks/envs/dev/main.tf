module "dev_instance" {
  source = "./compute"
  iname  = "dev-instance"
  ami_id = "ami-04ea4e8270c27626c"
  itype  = "t3.micro"
}

module "dev_security_group" {
  source         = "./security_group"
  sg_name        = "dev_sg"
  sg_description = "this is my dev sg"
  ports          = [22, 80, 9000, 8080, 3306]
}

module "dev_bucket" {
  source      = "./storage"
  bucket_name = "dev.devops77"
}
