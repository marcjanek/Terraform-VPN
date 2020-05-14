variable "ami" {
  type = string
  default = ""
  description = "ami/change later to lates in region"
}

variable "ssh_public_key" {
  type = string
  description = "path to ssh public key"
  //todo: validation
}

variable "region" {
  type = string
  default = "us-west-2"
}