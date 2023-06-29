variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "key_name" {
  type = string
}

variable "region" {
  type = string
}

variable "cidr_block" {
  type        = string
  description = "10.10.0.0/16"
}

variable "availability_zones" {
  type = list(any)
}

variable "mdgtask_instance_type" {
  type = string
}

variable "workstation_ip" {
  type = string
  default = "0.0.0.0/0"
}
