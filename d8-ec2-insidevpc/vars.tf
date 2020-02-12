variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AWS_ACCESS_KEY" {
  default = ""
}

variable "AWS_SECRET_KEY" {
  default = ""
}

variable "AMIS" {
  type = map(string)
  default = {
        eu-west-1 = "ami-0713f98de93617bb4"
  }
}

