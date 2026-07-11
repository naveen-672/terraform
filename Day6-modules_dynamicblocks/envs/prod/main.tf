module "prod_instance" {
  source = "/root/envs/prod/compute"
  iname  = "prod-instance"
  ami_id = "ami-04ea4e8270c27626c"
  itype  = "m7i-flex.large"
}

module "prod_security_group" {
  source         = "/root/envs/prod/security_group"
  sg_name        = "prod_sg"
  sg_description = "this is my prod sg"
  ports          = [22, 80, 9000, 8080, 3306]
}

module "prod_bucket" {
  source      = "/root/envs/prod/storage"
  bucket_name = "dev.devops77"
}
