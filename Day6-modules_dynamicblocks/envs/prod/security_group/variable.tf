variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "ports" {
  type = list(any)
}
