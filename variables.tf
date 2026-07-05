variable "iname" {
description = "instance name"
type = string
}

variable "ami_id" {
type = string
}

variable "itype" {
type = string
}

variable "key_pair" {
type = string
}

variable "az" {
type = string
}

variable "ebs_volume" {
type = number
}
