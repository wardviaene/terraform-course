variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0e472ba40eb589f49"
    us-west-2 = "ami-074251216af698218"
    us-west-1 = "ami-009726b835c24a3aa"
  }
}

variable "AWS_REGION" {
  type = string
  default = "us-west-2"
}

