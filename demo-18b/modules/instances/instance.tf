variable "ENV" {}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "PUBLIC_SUBNETS" {
  type = "list"
}

variable "VPC_ID" {}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "instance" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.INSTANCE_TYPE}"

  # the VPC subnet
  subnet_id = "${var.PUBLIC_SUBNETS[0]}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"

  tags {
    Name         = "instance-${var.ENV}"
    Environmnent = "${var.ENV}"
  }
}

resource "aws_security_group" "allow-ssh" {
  vpc_id      = "${var.VPC_ID}"
  name        = "allow-ssh-${var.ENV}"
  description = "security group that allows ssh and all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name         = "allow-ssh"
    Environmnent = "${var.ENV}"
  }
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair-${var.ENV}"
  public_key = "${file("${path.root}/${var.PATH_TO_PUBLIC_KEY}")}"
}
