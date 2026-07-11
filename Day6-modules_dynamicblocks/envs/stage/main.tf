module "stage_instance" {
source = "/root/envs/stage/compute"
iname = "stage-instance"
ami_id = "ami-04ea4e8270c27626c"
itype = "c7i-flex.large"
}

module "stage_security_group" {
source = "/root/envs/stage/security_group"
sg_name = "stage_sg"
sg_description = "this is my stage sg"
ports = [22, 80, 9000, 8080, 3306]
}

module "stage_bucket" {
source = "/root/envs/stage/storage"
bucket_name = "stage.devops77"
}
