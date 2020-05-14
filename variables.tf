variable "ami" {
  type = string
  default = "ami-003634241a8fcdec0"
  description = "ami/change later to lates in region"
}

variable "ssh_public_key_path" {
  type = string
  default = "key.pub"
  description = "path to ssh public key"
  //todo: validation
}

variable "ssh_public_key_name" {
  type = string
  default = "key"
}

variable "region" {
  type = string
  default = "us-west-2"
}