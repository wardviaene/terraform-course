variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0ebd6010e17c566c9"
    us-west-1 = "ami-027fb6336945ac7f3"
    us-west-2 = "ami-020d314a20e95e9d3"
    us-east-2 = "ami-04fb0d20368b5cb91"
  }
}

