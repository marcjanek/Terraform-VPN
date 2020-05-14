//config for EC2

resource "aws_key_pair" "instance_key_pair" {
  public_key = file(var.ssh_public_key_path)
  key_name = var.ssh_public_key_name
}

resource "aws_security_group" "VPN" {
  name = "VPN"
  //no VPC, because in default VPC
  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "SSH" {
  name = "Two-way ssh"
  //todo: change to one way
  //no VPC, becuse in deafult AWS VPC
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}


resource "aws_instance" "VPN_instance" {
  ami = var.ami
  instance_type = "t2.micro"

  key_name = aws_key_pair.instance_key_pair.id
  associate_public_ip_address = true//todo: check if it is required

  vpc_security_group_ids = [
    aws_security_group.SSH.id,
    aws_security_group.VPN.id
  ]
}