variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-026b57f3c383c2eec"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/tf_key.pri"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/tf_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

