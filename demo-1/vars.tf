variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-036490d46656c4818"
    us-west-2 = "ami-0964546d3da97e3ab"
    eu-west-1 = "ami-020fc399c31009b50"
  }
}

