locals {
  zone-a = "us-east-1a"
  zone-b = "us-east-1b"
  zone-c = "us-east-1c"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-08c40ec9ead489470"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0d75513e7706cf2d9"
  }
}

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "RDS_PASSWORD" {}