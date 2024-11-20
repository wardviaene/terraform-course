variable "instance_type" {
  type = map(any)
  default = {
    "example"        = "t2.micro"
    "other_instance" = "t4g.micro"
  }
}

variable "aws_region" {
  default = "us-east-1"
}